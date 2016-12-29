*** Settings ***
Resource       ./DownloadImage.robot

*** Keywords ***
Unsplash has images
    ${total_image}=     Get Matching Xpath Count    //*[@id="gridSingle"]/div/a
    Set Test Variable   ${test_total_image}         ${total_image}

Download image from unsplash '${total}' image
    :FOR    ${count}    IN RANGE    1    ${total}
    \    ${attr}=       Get Element Attribute     //*[@id="gridSingle"]/div[${count}]/a@style
    \    @{urls}=       Split String     ${attr}     "
    \    ${url}=     Get From List    ${urls}     1
    \    Download Image '${count}' From '${url}' Into Folder '${test_title}'