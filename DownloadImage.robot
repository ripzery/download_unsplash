*** Settings ***
Resource      ./keywords/Soccersuck.robot
Resource      ./keywords/Unsplash.robot

Test Teardown  Close All Browsers

*** Test Cases ***
[1] Download Image From Unsplash First Page
    [Documentation]    To download images from [${UNSPLASH_URL}] in the first page
    [Setup]            Setup Unsplash
    Given Unsplash has images
    And Create Folder From Window Title
    Then Download image from unsplash '${test_total_image}' image

[2] Download Image From Soccersuck Xcorner
    [Documentation]    To download images from [${SOCCERSUCK_URL}] in xcorner
    [Setup]            Setup Soccersuck
#    Given Soccersuck Has Xcorner Section
    When Enter Xcorner Url 'http://www.soccersuck.com/boards/topic/1419814'
    And Create Folder From Window Title
    Then Download All Images From The Poster Total '${test_total_image}'