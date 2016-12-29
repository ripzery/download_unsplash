*** Settings ***
Resource      ./keywords/Soccersuck.robot
Resource      ./keywords/Unsplash.robot

Test Teardown  Close All Browsers

*** Test Cases ***
[1] Download Image From Unsplash
    [Documentation]    To download images from [${UNSPLASH_URL}] in the first page
    [Setup]            Setup Unsplash
    ${total_image}=     Get Matching Xpath Count    //*[@id="gridSingle"]/div/a
    :FOR    ${count}    IN RANGE    1    ${total_image}
    \    ${attr}=       Get Element Attribute     //*[@id="gridSingle"]/div[${count}]/a@style
    \    @{urls}=       Split String     ${attr}     "
    \    ${url}=     Get From List    ${urls}     1
    \    Download Img    ${url}     ${count}

[2] Download Image From Soccersuck
    [Documentation]    To download images from [${SOCCERSUCK_URL}] in xcorner
    [Setup]            Setup Soccersuck
    Given Soccersuck Has Xcorner Section
    When Enter Xcorner Url '${test_xcorner_url}'
    And Create Folder From Window Title
    Then Download All Images From The Poster Total '${test_total_image}'