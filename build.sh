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

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Akkadian' \
   TITLE="The Standard Babylonian Etana Epic [State Archives of Assyria Cuneiform Texts v II]" \
   SUBTITLE='' \
   AUTHOR='Novotny' \
   YEAR='2001' \
   PUBLISHER='Vammalan Kirjapaino Oy' \
   NOTES='Cuneiform, transliteration, score, glossary, and sign list' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Akkadian' \
   TITLE="The Standard Babylonian Epic of Anzu [State Archives of Assyria Cuneiform Texts v III]" \
   SUBTITLE='' \
   AUTHOR='Annus' \
   YEAR='2001' \
   PUBLISHER='Vammalan Kirjapaino Oy' \
   NOTES='Cuneiform, transliteration, score, glossary, indices, and sign list' \

cat templates/library_endsubject.html >> docs/library.html

# Arabic
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Arabic' \
   TITLE="Easy Arabic Reader" \
   SUBTITLE='A Three-Part Text for Beginning Students' \
   AUTHOR='Gaafar' \
   YEAR='2011' \
   PUBLISHER='McGraw Hill' \
   NOTES='Arabic with glosses, exercises to test comprehension.  Endmatter includes answers and glosses.' \

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

# Coptic
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Coptic' \
   TITLE='Introduction to Sahidic Coptic' \
   SUBTITLE='' \
   AUTHOR='Lambdin' \
   YEAR='1983' \
   PUBLISHER='Mercer University Press' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Egyptian
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT="Egyptian" \
   TITLE="Middle Egyptian Literature" \
   SUBTITLE='Eight Literary Works of the Middle Kingdom' \
   AUTHOR='Allen' \
   YEAR='2015' \
   PUBLISHER='Cambridge University Press' \
   NOTES="Hieroglyphs, transcription, translation, and notes. Occasional illustrations.  Consecutive translations as appendix.  Works are: The Story of the Shipwrecked Sailor, The Story of Sinuhe, The Loyalist Instruction, The Instructions of the Kagemni's Father and Ptahhotep, The Discourses of the Eloquent Peasant, The Debate between a Man and His Soul, The Herdsman's Tale, Hymns to Senwosret III" \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT="Egyptian" \
   TITLE="The Book of the Dead" \
   SUBTITLE='' \
   AUTHOR='E.A. Wallace Budge' \
   YEAR='1895' \
   PUBLISHER='Gramercy' \
   NOTES="The Papyrus of Ani, in hieroglyphs with translation and notes.  Translation is dated and dubious in places." \

cat templates/library_endsubject.html >> docs/library.html

# Ge'ez
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT="Ge'ez" \
   TITLE="Ethiopic Grammar with Chrestomathy and Glossary" \
   SUBTITLE='' \
   AUTHOR='Mercer' \
   YEAR='1920' \
   PUBLISHER='Oxford University Press' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Greek
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE="46 Stories in Classical Greek" \
   SUBTITLE='' \
   AUTHOR='Groton' \
   YEAR='2014' \
   PUBLISHER='Hackett' \
   NOTES='Greek with glosses and glossary' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE='A Companion to the Ancient Greek Language' \
   SUBTITLE='' \
   AUTHOR='Bakker' \
   YEAR='2014' \
   PUBLISHER='WILEY Blackwell' \
   NOTES='' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE='Greek Epic Fragments [Loeb]' \
   SUBTITLE='' \
   AUTHOR='West' \
   YEAR='2003' \
   PUBLISHER='Harvard University Press' \
   NOTES='Greek with facing page translation.  Footnotes provided in both.' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE='Heraclitus: Fragments' \
   SUBTITLE='' \
   AUTHOR='Haxton' \
   YEAR='2003' \
   PUBLISHER='Penguin' \
   NOTES='Greek with facing page translation.  At initial glance, translation seems liberal and poetic.' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE='Herodotus: The Persian Wars [Loeb]' \
   SUBTITLE='Books I-II' \
   AUTHOR='Godley' \
   YEAR='1926' \
   PUBLISHER='Harvard University Press' \
   NOTES='Greek with facing page translation.' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE="PLATO's Apology of Socrates" \
   SUBTITLE='A Commentary' \
   AUTHOR='Miller' \
   YEAR='2010' \
   PUBLISHER='University of Oklahoma Press' \
   NOTES='Greek with glosses and generous footnotes, rich frontmatter, essays' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Greek' \
   TITLE="Teacher's Handbook Athenaze Book II" \
   SUBTITLE='An Introduction to Ancient Greek' \
   AUTHOR='Balme' \
   YEAR='1991' \
   PUBLISHER='Oxford University Press' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Hebrew
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Hebrew' \
   TITLE="Graded Reader of Biblical Hebrew" \
   SUBTITLE="A Guide to Reading the Hebrew Bible" \
   AUTHOR='Van Pelt' \
   YEAR='2006' \
   PUBLISHER='Zondervan' \
   NOTES='Hebrew, with notes, parsing questions, and grammatical commentary.  Solutions to the parsing questions are provided at the end.' \

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

# Hittite
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Hittite' \
   TITLE="The Elements of Hittite" \
   SUBTITLE='' \
   AUTHOR='Theo Van Den Hout' \
   YEAR='2011' \
   PUBLISHER='Cambridge University Press' \
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
   TITLE="38 Latin Stories" \
   SUBTITLE='' \
   AUTHOR='Groton' \
   YEAR='1995' \
   PUBLISHER='Bolchazy-Carducci Publishers, Inc' \
   NOTES='Latin with facing-page glossary, graded to Wheelock' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Auricula Meretricula" \
   SUBTITLE='' \
   AUTHOR='Blundell' \
   YEAR='1993' \
   PUBLISHER='Focus Information Group, Inc' \
   NOTES='Latin, with facing-page glossary, graded to Wheelock.  A play in 10 scenes, appendices include allusion list and combined vocabulary' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Caesar" \
   SUBTITLE='Selections from his Commentarii De Bello Gallico' \
   AUTHOR='Mueller' \
   YEAR='2013' \
   PUBLISHER='Bolchazy-Carducci Publishers, Inc' \
   NOTES="Mueller follows Pharr's format with heavy glosses and a fold-out glossary.  Selections of books 1, 4, 5, and 6 and provided in Latin, with the rest of the book provided in translation for context.  A complete glossary completes the work." \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Caesar's Gallic War" \
   SUBTITLE='Books I-VII' \
   AUTHOR='Dewey' \
   YEAR='1918' \
   PUBLISHER='Translation Publishing Company' \
   NOTES='Interlinear Latin-English' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="De Viris Illustribus" \
   SUBTITLE='' \
   AUTHOR='Anonymous' \
   YEAR='2025' \
   PUBLISHER='HypLern Interlinear Project' \
   NOTES='Interlinear' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Latin Literature" \
   SUBTITLE='A Book of Readings' \
   AUTHOR='Wheelock' \
   YEAR='1969' \
   PUBLISHER='Harper and Row Publishers' \
   NOTES='' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Phaedri Fabularum Aesopiarum" \
   SUBTITLE='' \
   AUTHOR='Phaedrus' \
   YEAR='2025' \
   PUBLISHER='HypLern Interlinear Project' \
   NOTES='Interlinear' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Selected Letters" \
   SUBTITLE='' \
   AUTHOR='Seneca' \
   YEAR='1916' \
   PUBLISHER='Cambridge Greek and Latin Classics' \
   NOTES='Latin with commentary' \

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
   TITLE="Vergil's Aeneid" \
   SUBTITLE='' \
   AUTHOR='Pharr' \
   YEAR='1964' \
   PUBLISHER='D.C. Heath and Company' \
   NOTES='Latin, with heavy glosses, running and fold-out glossary' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Latin' \
   TITLE="Workbook for Wheelock's Latin" \
   SUBTITLE='' \
   AUTHOR='Comeau' \
   YEAR='1997' \
   PUBLISHER='Harper Perennial' \
   NOTES='Additional exercises, without key' \

cat templates/library_endsubject.html >> docs/library.html

# Luwian
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Luwian' \
   TITLE="Hieroglyphic Luwian [Subsidia et Instrumenta Linguarum Orientis 2]" \
   SUBTITLE='An Introduction with Original Texts' \
   AUTHOR='Payne' \
   YEAR='2014' \
   PUBLISHER='Hubert & Co' \
   NOTES="" \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Luwian' \
   TITLE="Iron Age Hieroglyphic Luwian Inscriptions [Writings from the Ancient World]" \
   SUBTITLE='' \
   AUTHOR='Payne' \
   YEAR='2012' \
   PUBLISHER='Society of Biblical Literature' \
   NOTES="Each text is presented in transliteration, then in translations.  Notes included." \

cat templates/library_endsubject.html >> docs/library.html

# Mayan
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Mayan' \
   TITLE="Reading The Maya Glyphs" \
   SUBTITLE='' \
   AUTHOR='Coe' \
   YEAR='2001' \
   PUBLISHER='Thames and Hudson' \
   NOTES="Gorgeous hand-drawn hieroglyphs throughout.  Seems more like a compendium of miscellia rather than a grammar." \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Mayan' \
   TITLE="The Codex Borgia" \
   SUBTITLE='A Full-Color Restoration of the Ancient Mexican Manuscript' \
   AUTHOR='Diaz' \
   YEAR='2021' \
   PUBLISHER='Dover' \
   NOTES="Plates and description, no real translation" \

cat templates/library_endsubject.html >> docs/library.html

# Old Persian
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Old Persian' \
   TITLE="Old Persian, Grammar, Texts, Lexicon" \
   SUBTITLE='American Oriental Series V33' \
   AUTHOR='Kent' \
   YEAR='1950' \
   PUBLISHER='American Oriental Society' \
   NOTES="" \

cat templates/library_endsubject.html >> docs/library.html

# Sanskrit
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Sanskrit' \
   TITLE="An Introductory Sanskrit Reader" \
   SUBTITLE='Improving Reading Fluency' \
   AUTHOR='Ruppel' \
   YEAR='2022' \
   PUBLISHER='Brill' \
   NOTES="Devanagari, with generous vocabulary and notes.  Appendices include Roman transliteration, full translation, vocabulary.  Readings from Hitopadesa, Vikramacarita, Ramayana, Kathasaritsagara, Sanudasa's Story, Subhasitas" \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Sanskrit' \
   TITLE="Selections from the Upanishads" \
   SUBTITLE='' \
   AUTHOR='Rangacharya' \
   YEAR='2002' \
   PUBLISHER='Sri Rama Printers' \
   NOTES="Sanskrit mantras, interspersed with English translation.  No real linguistic notes or explanation" \

cat templates/library_endsubject.html >> docs/library.html

# Sumerian
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Sumerian' \
   TITLE="Epics of Sumerian Kings [Writings from the Ancient World]" \
   SUBTITLE='The Matter of Aratta' \
   AUTHOR='Vanstiphout' \
   YEAR='2003' \
   PUBLISHER='Society of Biblical Literature' \
   NOTES='Transcription with facing page translation, introduction: Enmerkar and Ensuhgirana, Enmerkar and the Lord of Aratta, The Lugalbanda Poems' \

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

# Tibetan
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Tibetan' \
   TITLE="An Introduction to Classical Tibetan" \
   SUBTITLE='' \
   AUTHOR='Hodge' \
   YEAR='2003' \
   PUBLISHER='Orchid Press' \
   NOTES='' \

cat templates/library_endsubject.html >> docs/library.html

# Ugaritic
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Ugaritic' \
   TITLE="Basics of Ugaritic" \
   SUBTITLE='A Concise Grammar, Workbook, and Lexicon' \
   AUTHOR='Williams' \
   YEAR='1967' \
   PUBLISHER='Zondervan' \
   NOTES='Unfortunately, the entire text appears in transcription.  13 lessons with a vocabulary list and answer key.' \

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Ugaritic' \
   TITLE="Ugaritic Narrative Poetry [Writings from the Ancient World]" \
   SUBTITLE='' \
   AUTHOR='Parker' \
   YEAR='1997' \
   PUBLISHER='Society of Biblical Literature' \
   NOTES='Texts provided in two-column format with transliteration and translation, with end notes.' \

cat templates/library_endsubject.html >> docs/library.html

# Ancient Near Eastern Studies
# ---------------------------------------------------------------------------------
cat templates/library_subject.html >> docs/library.html

cat templates/library_book.html >> docs/library.html
python3 generate.py --lib bar \
   SUBJECT='Ancient Near Eastern Studies' \
   TITLE="Slaves and Households in the Near East" \
   SUBTITLE='' \
   AUTHOR='Culbertson' \
   YEAR='2011' \
   PUBLISHER='Edwards Brothers' \
   NOTES='Seminar proceedings' \

cat templates/library_endsubject.html >> docs/library.html

cat templates/library_footer.html >> docs/library.html
python3 generate.py --lib foo

echo done
