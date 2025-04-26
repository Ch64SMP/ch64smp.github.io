#!/bin/bash

# Define the source directory for images and the target directory for .md files
IMG_DIR="static/img"
MD_DIR="content/cast-members"

# Ensure the target directory exists
mkdir -p "$MD_DIR"

# Loop through each image in the IMG_DIR
for img in "$IMG_DIR"/*; do
  # Extract the base name of the image (without extension)
  base_name=$(basename "$img" | sed 's/\.[^.]*$//')

  # Generate the .md file content
  cat <<EOF > "$MD_DIR/$base_name.md"
---
title: "$base_name"
styleName: $base_name
image: "img/$(basename "$img")"
youtube: "https://www.youtube.com/@$base_name"
---
EOF

  echo "Generated: $MD_DIR/$base_name.md"
done