#!/bin/bash

set -e

echo generating templates
# =================================================================================
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

# index
# =================================================================================

echo Akkadian reviews
cat templates/index_review_subject.html >> docs/index.html

cat templates/index_review_book.html >> docs/index.html
python3 generate.py --gen huehnergard \
   SUBJECT='Akkadian' \
   TITLE='A Grammar of Akkadian' \
   SUBTITLE='' \
   AUTHOR='John Huehnergard' \
   YEAR='2008' \
   PUBLISHER='Eisenbrauns' \
   CREATED='2-Oct 2026' \

#  cat templates/index_review_book.html >> docs/index.html
#  python3 generate.py --gen workbook_cuneiform \
#     SUBJECT='Akkadian' \
#     TITLE='A New Workbook of Cuneiform Signs' \
#     SUBTITLE='' \
#     AUTHOR='Daniel C. Snell' \
#     YEAR='2022' \
#     PUBLISHER='Eisenbrauns' \
#     CREATED='2-Oct 2026' \

cat templates/index_review_endsubject.html >> docs/index.html

echo Hebrew reviews
cat templates/index_review_subject.html >> docs/index.html

cat templates/index_review_book.html >> docs/index.html
python3 generate.py --gen 2mins_a_day \
   SUBJECT='Hebrew' \
   TITLE='Keep Up Your Biblical Hebrew in Two Minutes a Day' \
   SUBTITLE='' \
   AUTHOR='Johnathan Kline, PhD' \
   YEAR='2019' \
   PUBLISHER='Hendrickson Publishers' \
   CREATED='29-Sept 2026' \

cat templates/index_review_endsubject.html >> docs/index.html

echo finishing main page
cat templates/index_footer.html >> docs/index.html
python3 generate.py --index foo

echo library
# =================================================================================
cp templates/library_header.html docs/library.html

# Akkadian
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Akkadian' \
   TITLE='An Introduction to Akkadian Literature' \
   SUBTITLE='Contexts and Content' \
   AUTHOR='Lenzi' \
   YEAR='2019' \
   PUBLISHER='Eisenbrauns' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Aramaic
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Aramaic' \
   TITLE='Keep Up Your Biblical Aramaic in Two Minutes a Day' \
   SUBTITLE='' \
   AUTHOR='Kline' \
   YEAR='2017' \
   PUBLISHER='Hendrickson Publishers' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Greek
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE='A Companion to the Ancient Greek Language' \
   SUBTITLE='' \
   AUTHOR='Bakker' \
   YEAR='2014' \
   PUBLISHER='WILEY Blackwell' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Hebrew
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Hebrew' \
   TITLE='Learn Biblical Hebrew' \
   SUBTITLE='2nd Ed' \
   AUTHOR='Dobson' \
   YEAR='2005' \
   PUBLISHER='Baker Academic' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Kannada
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Kannada' \
   TITLE='A Kannada Grammar with Graduated Exercise' \
   SUBTITLE='' \
   AUTHOR='Spencer' \
   YEAR='1985' \
   PUBLISHER='Asian Educational Services' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Latin
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Seneca's Letters from a Stoic" \
   SUBTITLE='' \
   AUTHOR='Gummere' \
   YEAR='1916' \
   PUBLISHER='Dover' \
   NOTES='All 124 of the Espistulae Morales in English' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Selected Letters" \
   SUBTITLE='' \
   AUTHOR='Seneca' \
   YEAR='1916' \
   PUBLISHER='Cambridge Greek and Latin Classics' \
   NOTES='Latin with commentary' \

cat templates/library_endsubject.html >> docs/library.html

# Sumerian
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Sumerian' \
   TITLE='Learn to Read Ancient Sumerian (vols 1 and 2)' \
   SUBTITLE='An Introduction for Complete Beginners' \
   AUTHOR='Bowen' \
   YEAR='2020' \
   PUBLISHER='Digital Hammurabi Press' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

cat templates/library_footer.html >> docs/library.html
python3 generate.py --lib foo

echo done
