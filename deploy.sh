#!/bin/bash
set -e

echo "▶ Building Hugo site..."
cd personal
hugo --environment production
cd ..

echo "▶ Deploying to GitHub Pages..."
cd public

git checkout main

git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
cd ..

echo "✅ Done. Live at https://www.jangboolee.com"
