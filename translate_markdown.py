#!/usr/bin/env python3
"""
Script to translate all date-prefixed markdown files to German using GPT-5.
Preserves all markdown formatting and saves with _german suffix.
"""

import os
import re
import time
from datetime import datetime
import openai
from pathlib import Path
from dotenv import load_dotenv

def find_date_prefixed_markdown_files(directory):
    """
    Find all markdown files that start with a date pattern (YYYY_).
    Returns a sorted list of file paths.
    """
    directory = Path(directory)
    markdown_files = []
    
    # Pattern to match files starting with a year (YYYY_) but exclude _german files
    date_pattern = re.compile(r'^\d{4}_.*\.md$')
    german_pattern = re.compile(r'.*_german\.md$')
    
    for file_path in directory.iterdir():
        if file_path.is_file() and date_pattern.match(file_path.name) and not german_pattern.match(file_path.name):
            markdown_files.append(file_path)
    
    # Sort by filename to get chronological order
    return sorted(markdown_files)

def translate_markdown_file(input_filepath, output_filepath, api_key):
    """
    Translates a Markdown file to German using the GPT-5 model.

    Args:
        input_filepath (Path): The path to the source Markdown file.
        output_filepath (Path): The path to save the translated Markdown file.
        api_key (str): OpenAI API key.
    """
    print(f"Reading content from {input_filepath}...")
    try:
        with open(input_filepath, 'r', encoding='utf-8') as f:
            markdown_content = f.read()
    except FileNotFoundError:
        print(f"Error: The file {input_filepath} was not found.")
        return False
    except Exception as e:
        print(f"An error occurred while reading the file: {e}")
        return False

    # Initialize the OpenAI client
    try:
        client = openai.OpenAI(api_key=api_key)
    except Exception as e:
        print(f"Error initializing OpenAI client: {e}")
        return False

    # Detailed system prompt for preserving Markdown formatting
    system_prompt = """
    You are an expert translator specializing in technical and document translation from English to German.
    Your task is to translate the provided Markdown text.
    It is absolutely crucial that you preserve the original Markdown formatting exactly as it is.
    
    CRITICAL FORMATTING RULES:
    - Do NOT alter any Markdown syntax (e.g., #, *, _, ``, ```, [], (), |, -, +).
    - Headings, bold and italic text, lists, code blocks, links, and tables must remain structurally identical.
    - Preserve all image references and alt text - translate alt text but keep image file paths unchanged.
    - Preserve all link URLs - translate link text but keep URLs unchanged.
    - Only translate the actual text content, not the markdown syntax.
    - Do not add any commentary, notes, or introductions.
    - Your output must only be the translated Markdown with identical structure.
    - Return a single, complete Markdown document as the response.
    
    Translate all English text to German while maintaining perfect formatting.
    """

    print("Sending content to the OpenAI API for translation...")
    try:
        response = client.chat.completions.create(
            model="gpt-5",  # Use GPT-5 model
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": markdown_content}
            ],
            # GPT-5 only supports default temperature of 1
        )

        translated_content = response.choices[0].message.content

        print(f"Saving translated content to {output_filepath}...")
        with open(output_filepath, 'w', encoding='utf-8') as f:
            f.write(translated_content)

        print(f"Translation complete! German version saved as: {output_filepath}")
        return True

    except openai.APIError as e:
        print(f"An OpenAI API error occurred: {e}")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

def main():
    """Main function to execute the translation process."""
    # Load environment variables from .env file
    load_dotenv()
    
    # Set the directory to search for markdown files
    appendix_dir = Path(__file__).parent
    
    # Get API key from environment variable
    api_key = os.getenv('OPENAI_API_KEY')
    if not api_key:
        print("Error: OPENAI_API_KEY environment variable not set.")
        print("Please check that your .env file exists and contains OPENAI_API_KEY.")
        return
    
    # Find all date-prefixed markdown files
    print("Searching for date-prefixed markdown files...")
    markdown_files = find_date_prefixed_markdown_files(appendix_dir)
    
    if not markdown_files:
        print("No date-prefixed markdown files found in the appendix directory.")
        return
    
    print(f"Found {len(markdown_files)} date-prefixed markdown files:")
    for i, file_path in enumerate(markdown_files, 1):
        print(f"  {i}. {file_path.name}")
    
    # Translate all files
    print(f"\nTranslating all {len(markdown_files)} files...")
    
    successful_translations = 0
    failed_translations = 0
    
    total_start_time = time.time()
    
    for i, current_file in enumerate(markdown_files, 1):
        print(f"\n" + "="*60)
        print(f"[{i}/{len(markdown_files)}] STARTING: {current_file.name}")
        print(f"Time: {datetime.now().strftime('%H:%M:%S')}")
        print(f"="*60)
        
        # Generate output filename with _german suffix
        output_name = current_file.stem + "_german" + current_file.suffix
        output_path = current_file.parent / output_name
        
        # Check if output file already exists
        if output_path.exists():
            print(f"⚠️  German version already exists: {output_name}")
            print(f"✅ Will overwrite existing file...")
        
        # Start timing for this file
        file_start_time = time.time()
        
        # Perform the translation
        print(f"🔄 TRANSLATING: {current_file.name}")
        print(f"   → Output file: {output_name}")
        
        success = translate_markdown_file(current_file, output_path, api_key)
        
        # Calculate time taken
        file_end_time = time.time()
        time_taken = file_end_time - file_start_time
        
        if success:
            successful_translations += 1
            print(f"✅ COMPLETED: {current_file.name}")
            print(f"   → Time taken: {time_taken:.1f} seconds")
            print(f"   → German file created: {output_name}")
        else:
            failed_translations += 1
            print(f"❌ FAILED: {current_file.name}")
            print(f"   → Time taken: {time_taken:.1f} seconds")
        
        # Show progress
        elapsed_total = time.time() - total_start_time
        avg_time_per_file = elapsed_total / i
        estimated_remaining = (len(markdown_files) - i) * avg_time_per_file
        
        print(f"📊 Progress: {i}/{len(markdown_files)} files processed")
        print(f"⏱️  Total elapsed: {elapsed_total:.1f}s | Avg per file: {avg_time_per_file:.1f}s")
        print(f"⏳ Estimated remaining: {estimated_remaining:.1f}s")
    
    # Final timing summary
    total_time = time.time() - total_start_time
    avg_time = total_time / len(markdown_files) if len(markdown_files) > 0 else 0
    
    # Summary report
    print(f"\n" + "="*60)
    print(f"TRANSLATION SUMMARY")
    print(f"="*60)
    print(f"📊 Total files found: {len(markdown_files)}")
    print(f"✅ Successful translations: {successful_translations}")
    print(f"❌ Failed translations: {failed_translations}")
    print(f"⏱️  Total time: {total_time:.1f} seconds ({total_time/60:.1f} minutes)")
    print(f"⏱️  Average per file: {avg_time:.1f} seconds")
    print(f"🕐 Completed at: {datetime.now().strftime('%H:%M:%S')}")
    
    if successful_translations > 0:
        print(f"\n🎉 Successfully created {successful_translations} German translations!")
    
    if failed_translations > 0:
        print(f"\n⚠️  {failed_translations} files failed to translate. Check API key and network connection.")

if __name__ == '__main__':
    main()