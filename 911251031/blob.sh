create_and_upload_numbers() {
  local file="numbers.txt"
  seq 1 100 > "$file"
  echo "📄 Created $file"

  az storage blob upload \
    --account-name "terraformbck" \
    --container-name "terracbc" \
    --name "$file" \
    --file "$file" \
    --auth-mode login \
    --overwrite true \
    --output none

  az storage blob list \
    --account-name "terraformbck" \
    --container-name "terracbc" \
    --auth-mode login \
    --query "[?name=='$file'].name" \
    --output tsv | grep -q "$file" && echo "✅ $file uploaded!" || echo "❌ Upload failed."
}
