#!/bin/bash

echo "Downloading the dataset..."

# Check if gdown is installed
if ! command -v gdown &> /dev/null; then
    echo "gdown not found. Installing gdown..."
    pip install gdown
fi

FILE_ID="1t6pih74z_iO_Y5tphenURjGr2lUiLD6E"
OUTPUT_FILE="$(dirname "$0")/all-the-news-2-1-SMALL-CLEANED.csv"

echo "Downloading all-the-news-2-1-SMALL-CLEANED.csv to data directory..."
gdown --id "$FILE_ID" -O "$OUTPUT_FILE"

if [ -f "$OUTPUT_FILE" ]; then
    echo "Download complete! File saved as $OUTPUT_FILE"
    echo "File size: $(du -h "$OUTPUT_FILE" | cut -f1)"
else
    echo "Download failed. Please try manually:"
    echo "1. Go to https://drive.google.com/file/d/1t6pih74z_iO_Y5tphenURjGr2lUiLD6E/view?usp=sharing"
    echo "2. Download 'all-the-news-2-1-SMALL-CLEANED.csv'"
    echo "3. Save it to the data directory"
fi
