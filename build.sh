#!/bin/bash

set -e

python3 generate.py index.html docs/index.html

python3 generate.py review.html docs/huehnergard.html \
   TITLE='A Grammar of Akkadian' \
   SUBTITLE='' \
   AUTHOR='' \
   YEAR='' \
   PUBLISHER=''
