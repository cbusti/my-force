#!/bin/bash

# Step 1: Create the file
FILE="punk_numbers.txt"
seq 1 100 > "$FILE"
echo "Created $FILE with numbers 1 to 100."

# Step 2: Upload to blob container
echo "Uploading $FILE to container 'terracbc'..."
az storage blob upload \
  --account-name "terraformbck" \
  --container-name "terracbc" \
  --name "$FILE" \
  --file "$FILE" \
  --auth-mode login \
  --overwrite true \
  --output none

# Step 3: List contents of the container in table format
echo "Listing blobs in 'terracbc'..."
az storage blob list \
  --account-name "terraformbck" \
  --container-name "terracbc" \
  --auth-mode login \
  --query "[].{Name:name, Type:properties.blobType, Size:properties.contentLength}" \
  --output table
