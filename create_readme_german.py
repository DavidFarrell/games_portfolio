#!/usr/bin/env python3
"""
Script to create a comprehensive README_german.md by concatenating all German game portfolio files in chronological order.
"""

import os
import re
from pathlib import Path

def extract_year_from_filename(filename):
    """Extract year from filename like '2005_evil_machines_german.md'"""
    match = re.match(r'^(\d{4})_.*_german\.md$', filename)
    return int(match.group(1)) if match else 0

def main():
    # Get all German markdown files (files ending with _german.md)
    portfolio_files = []
    
    for file in os.listdir('.'):
        if (file.endswith('_german.md') and 
            not file.startswith('.') and
            file != 'README_german.md'):  # Exclude the output file itself
            portfolio_files.append(file)
    
    # Sort by year extracted from filename (reverse chronological - newest first)
    portfolio_files.sort(key=extract_year_from_filename, reverse=True)
    
    print(f"Found {len(portfolio_files)} German portfolio files:")
    for file in portfolio_files:
        year = extract_year_from_filename(file)
        print(f"  {year}: {file}")
    
    if not portfolio_files:
        print("❌ No German portfolio files found! Make sure the translation script has run first.")
        return
    
    # Create the comprehensive German README
    with open('README_german.md', 'w', encoding='utf-8') as readme:
        # Write German header
        readme.write("# Spiele-Portfolio (2024-2005)\n\n")
        readme.write("Ein umfassendes Portfolio mit fast zwei Jahrzehnten innovativer Spielentwicklung, ")
        readme.write("von den neuesten forschungsbasierten Serious Games bis zu bahnbrechenden plattformübergreifenden Erfahrungen ")
        readme.write("und preisgekrönten Bildungsinterventionen.\n\n")
        
        readme.write("## Portfolio-Übersicht\n\n")
        readme.write("Dieses Portfolio umfasst **19 Jahre** Spielentwicklung (2005-2024) mit:\n\n")
        readme.write("- **Bildungs- & Serious Games**: Lehrplan-orientierte Lernerfahrungen mit messbarer Wirkung\n")
        readme.write("- **Gesundheitsinterventionen**: Digitale Verhaltensänderungs-Tools mit klinischer Validierung\n")
        readme.write("- **Klima & Umwelt**: Politiksimulationsspiele für Stakeholder-Engagement\n")
        readme.write("- **Forschungspartnerschaften**: EU-geförderte Projekte mit wissenschaftlichen Institutionen\n")
        readme.write("- **Plattformübergreifende Innovation**: Von früher Mobil-Web-Integration bis zu moderner digitaler Distribution\n")
        readme.write("- **Auszeichnungen**: Mehrere internationale Gaming- und Bildungspreise\n\n")
        
        readme.write("---\n\n")
        
        # Process each German file
        for i, filename in enumerate(portfolio_files):
            print(f"Verarbeite {filename}...")
            
            try:
                with open(filename, 'r', encoding='utf-8') as file:
                    content = file.read()
                    
                    # Add separator between games (except for first one)
                    if i > 0:
                        readme.write("\n---\n\n")
                    
                    # Write the content
                    readme.write(content)
                    readme.write("\n")
            except FileNotFoundError:
                print(f"⚠️  Datei nicht gefunden: {filename}")
                continue
            except UnicodeDecodeError:
                print(f"⚠️  Encoding-Problem mit Datei: {filename}")
                continue
    
    print(f"\n✅ README_german.md erfolgreich erstellt!")
    print(f"📄 {len(portfolio_files)} deutsche Spiele-Portfolios kombiniert")
    
    # Get file size for confirmation
    try:
        readme_size = os.path.getsize('README_german.md')
        print(f"📊 Endgültige Dateigröße: {readme_size:,} bytes")
    except FileNotFoundError:
        print("❌ Fehler beim Erstellen der README_german.md")

if __name__ == "__main__":
    main()