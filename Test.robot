*** Settings ***
Library           Selenium2Library
Library           RequestsLibrary
Library           Collections
Library           String
Library           lib.py

*** Test Cases ***
Download Image From Unsplash
    [Tags]    DEBUG
    Open Browser     https://unsplash.com/?grid=single     chrome
    ${total_image}=     Get Matching Xpath Count    //*[@id="gridSingle"]/div/a
    :FOR    ${count}    IN RANGE    1    ${total_image}
    \    ${attr}=       Get Element Attribute     //*[@id="gridSingle"]/div[${count}]/a@style
    \    @{urls}=       Split String     ${attr}     "
    \    ${url}=     Get From List    ${urls}     1
    \    Download Img    ${url}     ${count}
    [Teardown]  Close All Browsers

Download Image From Soccersuck
    Open Browser        http://www.soccersuck.com     chrome
    Wait Until Element Is Visible      xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a/img
    Click Element       xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a/img
    ${total_image}=     Get Matching Xpath Count    //*[@id="container"]/div[6]/div[2]/div[2]/img
    log     ${total_image}
    :FOR    ${count}    IN RANGE    1    ${total_image}
    \    ${url}=       Get Element Attribute     //*[@id="container"]/div[6]/div[2]/div[2]/img[${count}]@src
    \    log     ${url}
    \    Download Img    ${url}     ${count}
    [Teardown]  Close All Browsers

*** Keywords ***
Provided precondition