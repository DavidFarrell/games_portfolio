#!/usr/bin/env python3
"""
Script to convert the README.md file to a well-formatted PDF.
Uses markdown2 for parsing and reportlab for PDF generation with proper styling.
"""

import os
import sys
import markdown2
from reportlab.lib.pagesizes import letter, A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, PageBreak
from reportlab.lib.colors import black, blue, gray
from reportlab.lib.enums import TA_LEFT, TA_CENTER
import re

def check_dependencies():
    """Check if required packages are available"""
    try:
        import markdown2
        from reportlab.platypus import SimpleDocTemplate
        return True
    except ImportError as e:
        print(f"Missing dependency: {e}")
        print("Please install with: pip install markdown2 reportlab")
        return False

def clean_markdown_for_pdf(md_content):
    """Clean markdown content to work better with PDF generation"""
    # Remove image references (since we can't easily embed them)
    md_content = re.sub(r'!\[.*?\]\(.*?\)', '[Image]', md_content)
    
    # Convert markdown links to plain text with URL
    md_content = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'\1 (\2)', md_content)
    
    # Clean up multiple line breaks
    md_content = re.sub(r'\n{3,}', '\n\n', md_content)
    
    return md_content

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
    
    # Clean markdown for PDF conversion
    md_content = clean_markdown_for_pdf(md_content)
    
    # Convert markdown to HTML
    html_content = markdown2.markdown(md_content, extras=['fenced-code-blocks', 'tables'])
    
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
    
    # Split content into sections and create flowables
    story = []
    
    # Split by lines and process
    lines = md_content.split('\n')
    i = 0
    
    while i < len(lines):
        line = lines[i].strip()
        
        if not line:
            i += 1
            continue
            
        # Main title (first # heading)
        if line.startswith('# ') and 'Games Portfolio' in line:
            story.append(Paragraph(line[2:], title_style))
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
            
        i += 1
    
    # Build PDF
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