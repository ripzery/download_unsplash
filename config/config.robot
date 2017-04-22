*** Settings ***
Library           Selenium2Library
Library           Collections
Library           String
Library           ../lib.py

*** Variables ***
${UNSPLASH_URL}     https://unsplash.com/new?grid=multi
${SOCCERSUCK_URL}   http://www.soccersuck.com
${BROWSER}          phantomjs
${UNSPLASH_SCROLL_TIMES}     10
${UNSPLASH_IMAGE_WIDTH}      1919
${UNSPLASH_IMAGE_HEIGHT}     1080