#!/bin/bash

set -e

echo generating templates
if [ -d 'gen' ]; then
   rm -rf 'gen'
fi
mkdir -p gen
cp templates/index_header.html docs/index.html
for file in reviews/*; do
   filename=$(basename "$file")
   echo '   '$filename
   cat \
      templates/review_header.html \
      reviews/$filename \
      templates/review_footer.html \
      > gen/$filename
done

echo Akkadian reviews
cat templates/index_review_subject.html >> docs/index.html

cat templates/index_review_book.html >> docs/index.html
python3 generate.py --gen huehnergard \
   SUBJECT='Akkadian' \
   TITLE='A Grammar of Akkadian' \
   SUBTITLE='' \
   AUTHOR='John Huehnergard' \
   YEAR='2026' \
   PUBLISHER='Harvard University Press' \

cat templates/index_review_endsubject.html >> docs/index.html

echo finishing main page
cat templates/index_footer.html >> docs/index.html

echo done
