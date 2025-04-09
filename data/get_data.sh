#!/bin/bash

echo "Downloading the dataset..."

# Check if gdown is installed
if ! command -v gdown &> /dev/null; then
    echo "gdown not found. Installing gdown..."
    pip install gdown
fi

# The Google Drive file ID for all-the-news-2-1-SMALL-CLEANED.csv
# This ID was extracted from the shared folder link
FILE_ID="1QoqGS6XE8BONzPvUQCVuGjaBdt_GaXlz"
# Save to the current directory (data/)
OUTPUT_FILE="$(dirname "$0")/all-the-news-2-1-SMALL-CLEANED.csv"

echo "Downloading all-the-news-2-1-SMALL-CLEANED.csv to data directory..."
gdown --id $FILE_ID -O "$OUTPUT_FILE"

if [ -f "$OUTPUT_FILE" ]; then
    echo "Download complete! File saved as $OUTPUT_FILE"
    echo "File size: $(du -h "$OUTPUT_FILE" | cut -f1)"
else
    echo "Download failed. Please try manually:"
    echo "1. Go to https://drive.google.com/drive/folders/1hmPKKKQJKblbLGdHaWYjNFsaeSLIzTIc?usp=sharing"
    echo "2. Download 'all-the-news-2-1-SMALL-CLEANED.csv'"
    echo "3. Save it to the data directory"
fi