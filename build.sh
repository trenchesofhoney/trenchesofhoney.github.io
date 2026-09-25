#!/bin/bash

set -e

echo generating templates
if [ -d 'gen' ]; then
   rm -rf 'gen'
fi
mkdir -p gen
for file in reviews/*; do
   filename=$(basename "$file")
   echo '   '$filename
   cat \
      templates/review_header.html \
      reviews/$filename \
      templates/review_footer.html \
      > gen/$filename
done

echo generating main page
python3 generate.py index.html docs/index.html

echo generating reviews
python3 generate.py --gen huehnergard \
   TITLE='A Grammar of Akkadian' \
   SUBTITLE='' \
   AUTHOR='' \
   YEAR='' \
   PUBLISHER=''

echo done
