*** Settings ***
Library           Selenium2Library
Library           Collections
Library           String
Library           ../lib.py

*** Variables ***
${UNSPLASH_URL}     https://unsplash.com/?grid=single
${SOCCERSUCK_URL}   http://www.soccersuck.com
${BROWSER}          phantomjs