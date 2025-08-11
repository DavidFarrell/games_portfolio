#!/usr/bin/env python3
"""
Script to create a comprehensive README.md by concatenating all game portfolio files in chronological order.
"""

import os
import re
from pathlib import Path

def extract_year_from_filename(filename):
    """Extract year from filename like '2005_evil_machines.md'"""
    match = re.match(r'^(\d{4})_.*\.md$', filename)
    return int(match.group(1)) if match else 0

def main():
    # Get all markdown files except CLAUDE.md and any existing README.md
    portfolio_files = []
    
    for file in os.listdir('.'):
        if (file.endswith('.md') and 
            file != 'CLAUDE.md' and 
            file != 'README.md' and
            not file.startswith('.')):
            portfolio_files.append(file)
    
    # Sort by year extracted from filename
    portfolio_files.sort(key=extract_year_from_filename)
    
    print(f"Found {len(portfolio_files)} portfolio files:")
    for file in portfolio_files:
        year = extract_year_from_filename(file)
        print(f"  {year}: {file}")
    
    # Create the comprehensive README
    with open('README.md', 'w', encoding='utf-8') as readme:
        # Write header
        readme.write("# Games Portfolio (2005-2024)\n\n")
        readme.write("A comprehensive portfolio showcasing nearly two decades of innovative game development, ")
        readme.write("from pioneering cross-platform experiences to award-winning educational interventions ")
        readme.write("and research-backed serious games.\n\n")
        
        readme.write("## Portfolio Overview\n\n")
        readme.write("This portfolio spans **19 years** of game development (2005-2024), featuring:\n\n")
        readme.write("- **Educational & Serious Games**: Curriculum-aligned learning experiences with measurable impact\n")
        readme.write("- **Health Interventions**: Digital behavior change tools with clinical validation\n")
        readme.write("- **Climate & Environmental**: Policy simulation games for stakeholder engagement\n")
        readme.write("- **Research Partnerships**: EU-funded projects with academic institutions\n")
        readme.write("- **Cross-Platform Innovation**: From early mobile-web integration to modern digital distribution\n")
        readme.write("- **Award Recognition**: Multiple international gaming and educational awards\n\n")
        
        readme.write("---\n\n")
        
        # Process each file
        for i, filename in enumerate(portfolio_files):
            print(f"Processing {filename}...")
            
            with open(filename, 'r', encoding='utf-8') as file:
                content = file.read()
                
                # Add separator between games (except for first one)
                if i > 0:
                    readme.write("\n---\n\n")
                
                # Write the content
                readme.write(content)
                readme.write("\n")
    
    print(f"\n✅ README.md created successfully!")
    print(f"📄 Combined {len(portfolio_files)} game portfolios")
    
    # Get file size for confirmation
    readme_size = os.path.getsize('README.md')
    print(f"📊 Final file size: {readme_size:,} bytes")

if __name__ == "__main__":
    main()