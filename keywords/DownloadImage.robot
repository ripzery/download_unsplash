*** Settings ***
Resource      ../config/config.robot

*** Keywords ***
Create Folder From Window Title
    Get Folder Name From Window Title
    Create Folder   ${test_title}

Download Image '${number}' From '${url}' Into Folder '${folder}'
    Download Img    ${folder}    ${url}     ${number}

Get Folder Name From Window Title
    @{title}=     Get Window Titles
    ${title}=     Get From List     ${title}     0
    Set Test Variable     ${test_title}      ${title}

Setup Unsplash
    Open Browser        ${UNSPLASH_URL}      ${BROWSER}

Setup Soccersuck
    Open Browser        ${SOCCERSUCK_URL}    ${BROWSER}