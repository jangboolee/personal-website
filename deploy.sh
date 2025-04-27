#!/bin/bash
set -euo pipefail

echo "▶ Building Hugo site..."
cd personal
hugo --environment production
cd ..

echo "▶ Deploying to GitHub Pages..."

pushd public > /dev/null

# Make sure we're on the right branch
git checkout main

git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')" || echo "Nothing to commit."
git push origin main

popd > /dev/null

echo "✅ Done! Live at https://www.jangboolee.com"
