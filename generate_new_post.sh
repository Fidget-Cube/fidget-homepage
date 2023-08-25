#!/bin/bash
# Run this script to automatically populate the website with a new post!
# Must be run from the root project directory

# INPUTS
# - Name of post (there should be a .md file of the same name in the /posts directory)

HTML_NAME=`echo $1 | sed 's/\(.*\)/frontend\/posts\/\1\.php/'`
MD_NAME=`echo $1 | sed 's/\(.*\)/posts\/\1\.md/'`
pandoc --standalone --template='posts/template_mainpage.html' --wrap=none --ascii=true -f markdown -t html -o $HTML_NAME $MD_NAME
