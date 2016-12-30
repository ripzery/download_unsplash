*** Settings ***
Resource       ./DownloadImage.robot

*** Keywords ***
Unsplash has images
    ${total_image}=     Get Matching Xpath Count    //*[@id="gridSingle"]/div/a
    Set Test Variable   ${test_total_image}         ${total_image}

Download image from unsplash '${total}' image
    Log To Console   \r\nStart loading and images...\r\n
    :FOR    ${count}    IN RANGE    1    ${total}
    \    ${attr}=       Get Element Attribute     //*[@id="gridSingle"]/div[${count}]/a@style
    \    ${url}=    Fetch From Right      ${attr}    url(
    \    ${url}=    Fetch From Left       ${url}     ?
    \    ${url}=    Remove String         ${url}     "
    \    ${url}=    Catenate     SEPARATOR=     ${url}      ?w=1280&h=720
    \    Log To Console  ${url}
    \    Download Image '${count}' From '${url}' Into Folder '${test_title}'