#!/usr/bin/env python3
"""
Script to convert the README.md file to a well-formatted PDF with embedded images.
Uses markdown2 for parsing and reportlab for PDF generation with proper styling and image embedding.
"""

import os
import sys
import markdown2
from reportlab.lib.pagesizes import letter, A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, PageBreak, Image
from reportlab.lib.colors import black, blue, gray
from reportlab.lib.enums import TA_LEFT, TA_CENTER
from PIL import Image as PILImage
import re

def check_dependencies():
    """Check if required packages are available"""
    try:
        import markdown2
        from reportlab.platypus import SimpleDocTemplate
        from PIL import Image as PILImage
        return True
    except ImportError as e:
        print(f"Missing dependency: {e}")
        print("Please install with: pip install markdown2 reportlab pillow")
        return False

def extract_images_from_markdown(md_content):
    """Extract image references from markdown and return cleaned content with image info"""
    images = []
    image_pattern = r'!\[([^\]]*)\]\(([^)]+)\)'
    
    # Find all images
    for match in re.finditer(image_pattern, md_content):
        alt_text = match.group(1)
        image_path = match.group(2)
        images.append({
            'alt_text': alt_text,
            'path': image_path,
            'full_match': match.group(0)
        })
    
    return images

def clean_markdown_for_pdf(md_content):
    """Clean markdown content to work better with PDF generation"""
    # Convert markdown links to plain text with URL (but preserve image syntax)
    # Use negative lookbehind (?<!!!) to avoid matching ![alt](src) image syntax
    md_content = re.sub(r'(?<!!)\[([^\]]+)\]\(([^)]+)\)', r'\1 (\2)', md_content)
    
    # Clean up multiple line breaks
    md_content = re.sub(r'\n{3,}', '\n\n', md_content)
    
    return md_content

def create_image_flowable(image_path, max_width=6*inch, max_height=4*inch):
    """Create a reportlab Image flowable with proper sizing"""
    if not os.path.exists(image_path):
        print(f"⚠️  Image not found: {image_path}")
        return Paragraph(f"[Image not found: {image_path}]", getSampleStyleSheet()['Normal'])
    
    try:
        # Get image dimensions using PIL
        with PILImage.open(image_path) as pil_img:
            orig_width, orig_height = pil_img.size
        
        # Calculate scaling to fit within max dimensions
        width_scale = max_width / orig_width
        height_scale = max_height / orig_height
        scale = min(width_scale, height_scale, 1.0)  # Don't upscale
        
        final_width = orig_width * scale
        final_height = orig_height * scale
        
        print(f"📷 Adding image: {image_path} ({orig_width}x{orig_height} → {int(final_width)}x{int(final_height)})")
        
        return Image(image_path, width=final_width, height=final_height)
        
    except Exception as e:
        print(f"❌ Error processing image {image_path}: {e}")
        return Paragraph(f"[Image error: {image_path}]", getSampleStyleSheet()['Normal'])

def markdown_to_pdf(input_file='README.md', output_file='Games_Portfolio.pdf'):
    """Convert markdown file to PDF with proper formatting"""
    
    # Check if input file exists
    if not os.path.exists(input_file):
        print(f"Error: {input_file} not found!")
        return False
    
    # Read the markdown file
    with open(input_file, 'r', encoding='utf-8') as f:
        md_content = f.read()
    
    print(f"📄 Processing {len(md_content):,} characters from {input_file}")
    
    # Extract images before cleaning
    images = extract_images_from_markdown(md_content)
    print(f"🖼️  Found {len(images)} images to embed")
    
    # Clean markdown for PDF conversion (but keep image references for now)
    cleaned_content = clean_markdown_for_pdf(md_content)
    
    # Create PDF document
    doc = SimpleDocTemplate(
        output_file,
        pagesize=A4,
        topMargin=0.75*inch,
        bottomMargin=0.75*inch,
        leftMargin=0.75*inch,
        rightMargin=0.75*inch
    )
    
    # Define styles
    styles = getSampleStyleSheet()
    
    # Custom styles for better formatting
    title_style = ParagraphStyle(
        'CustomTitle',
        parent=styles['Title'],
        fontSize=24,
        textColor=black,
        spaceAfter=20,
        alignment=TA_CENTER
    )
    
    heading1_style = ParagraphStyle(
        'CustomHeading1',
        parent=styles['Heading1'],
        fontSize=18,
        textColor=black,
        spaceAfter=12,
        spaceBefore=20
    )
    
    heading2_style = ParagraphStyle(
        'CustomHeading2',
        parent=styles['Heading2'],
        fontSize=14,
        textColor=black,
        spaceAfter=8,
        spaceBefore=12
    )
    
    body_style = ParagraphStyle(
        'CustomBody',
        parent=styles['Normal'],
        fontSize=10,
        textColor=black,
        spaceAfter=6,
        alignment=TA_LEFT
    )
    
    # Use whole-document approach to handle images that span lines
    story = []
    
    # Image regex that can handle spanning lines
    img_pattern = re.compile(r'!\[([^\]]*)\]\(\s*([^)]+?)\s*\)', re.DOTALL)
    
    pos = 0
    image_count = 0
    for match in img_pattern.finditer(cleaned_content):
        image_count += 1
        # Add text before the image
        pre_text = cleaned_content[pos:match.start()].strip()
        if pre_text:
            # Process the text content line by line
            lines = pre_text.split('\n')
            for line in lines:
                line = line.strip()
                if not line:
                    continue
                    
                # Main title (first # heading)
                if line.startswith('# ') and ('Games Portfolio' in line or 'Appendix' in line):
                    # Update title as requested
                    story.append(Paragraph("Appendix: Games Portfolio 2005 to 2024", title_style))
                    story.append(Spacer(1, 12))
                    
                # Level 1 headings (game titles)
                elif line.startswith('# '):
                    if story:  # Add page break before each new game (except first)
                        story.append(PageBreak())
                    story.append(Paragraph(line[2:], heading1_style))
                    
                # Level 2 headings (sections)
                elif line.startswith('## '):
                    story.append(Paragraph(line[3:], heading2_style))
                    
                # Level 3 headings (subsections)
                elif line.startswith('### '):
                    story.append(Paragraph(f"<b>{line[4:]}</b>", body_style))
                    
                # Horizontal rules
                elif line.startswith('---'):
                    story.append(Spacer(1, 20))
                    
                # Bullet points
                elif line.startswith('- '):
                    story.append(Paragraph(f"• {line[2:]}", body_style))
                    
                # Bold text patterns
                elif line.startswith('**') and line.endswith('**'):
                    story.append(Paragraph(f"<b>{line[2:-2]}</b>", body_style))
                    
                # Regular paragraphs
                elif line:
                    # Handle bold text within paragraphs
                    line = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', line)
                    line = re.sub(r'\*(.*?)\*', r'<i>\1</i>', line)
                    story.append(Paragraph(line, body_style))
        
        # Now add the image
        alt_text = match.group(1)
        image_path = match.group(2)
        
        print(f"🖼️  Processing image: {image_path}")
        
        # Add caption if alt text exists
        if alt_text:
            caption_style = ParagraphStyle(
                'Caption',
                parent=body_style,
                fontSize=9,
                textColor=gray,
                alignment=TA_CENTER,
                spaceAfter=6
            )
            story.append(Paragraph(f"<i>{alt_text}</i>", caption_style))
        
        # Add the actual image
        img_flowable = create_image_flowable(image_path)
        story.append(img_flowable)
        story.append(Spacer(1, 12))
        
        pos = match.end()
    
    # Add any remaining text after the last image
    remaining_text = cleaned_content[pos:].strip()
    if remaining_text:
        lines = remaining_text.split('\n')
        for line in lines:
            line = line.strip()
            if not line:
                continue
                
            # Process remaining text with same logic
            if line.startswith('# '):
                if story:
                    story.append(PageBreak())
                story.append(Paragraph(line[2:], heading1_style))
            elif line.startswith('## '):
                story.append(Paragraph(line[3:], heading2_style))
            elif line.startswith('### '):
                story.append(Paragraph(f"<b>{line[4:]}</b>", body_style))
            elif line.startswith('---'):
                story.append(Spacer(1, 20))
            elif line.startswith('- '):
                story.append(Paragraph(f"• {line[2:]}", body_style))
            elif line.startswith('**') and line.endswith('**'):
                story.append(Paragraph(f"<b>{line[2:-2]}</b>", body_style))
            elif line:
                line = re.sub(r'\*\*(.*?)\*\*', r'<b>\1</b>', line)
                line = re.sub(r'\*(.*?)\*', r'<i>\1</i>', line)
                story.append(Paragraph(line, body_style))
    
    # Build PDF
    print(f"🔄 Processed {image_count} images during document parsing")
    print(f"🔄 Generating PDF with {len(story)} elements...")
    doc.build(story)
    
    # Get file size
    pdf_size = os.path.getsize(output_file)
    print(f"✅ PDF created successfully: {output_file}")
    print(f"📊 File size: {pdf_size:,} bytes ({pdf_size/1024:.1f} KB)")
    
    return True

def main():
    print("🎮 Games Portfolio Markdown to PDF Converter")
    print("=" * 50)
    
    # Check dependencies
    if not check_dependencies():
        return 1
    
    # Convert markdown to PDF
    success = markdown_to_pdf('README.md', 'Games_Portfolio_2024-2005.pdf')
    
    if success:
        print("\n🎉 Conversion completed successfully!")
        print("📁 You can now share Games_Portfolio_2024-2005.pdf")
    else:
        print("\n❌ Conversion failed!")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main())