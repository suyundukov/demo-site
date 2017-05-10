#!/usr/bin/env bash
set -e

# Building main stuff (npm)
npm run build:ci

# Building Hugo themes
THEMES=(hugo-sustain hugo-vitae)
for i in "${THEMES[@]}"
do
  # Cloning Git Repos with themes
  git clone https://github.com/nurlansu/"$i".git ./source/themes/"$i"/themes/"$i"
  # Adding "Fork me" button
  find ./source/themes/"$i"/ -name "*.html" -exec perl -pe 's/<\/body>/`cat .\/source\/themes\/'"${i}"'\/github.txt`/ge' -i {} \;
  # Building themes
  hugo -s ./source/themes/"$i"
done

# Building .html files
cp ./source/*.html ./public/

# Minifying html files
minify -r -o ./public/ --match=\.html ./public/
