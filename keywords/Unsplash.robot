*** Settings ***
Resource       ./DownloadImage.robot

*** Keywords ***
Unsplash has images
    Wait Until Element Is Visible   //*[@id="gridMulti"]/div[1]/div[1]
    :FOR     ${count}  IN RANGE   ${UNSPLASH_SCROLL_TIMES}
    \         Execute Javascript        window.scrollTo(0,1000000)
    \         Sleep     2
    ${total_image}=     Get Matching Xpath Count    //*[@id="gridMulti"]/div[1]/div/div/a
    Set Test Variable   ${test_total_image}         ${total_image}

Download image from unsplash '${total}' image
    Log To Console   \r\nStart loading and images...\r\n
    :FOR    ${count}    IN RANGE    1    ${total}
#    \    ${attr}=       Get Element Attribute     //*[@id="gridSingle"]/div[${count}]/a@style
    \    ${attr}=       Get Element Attribute     //*[@id="gridMulti"]/div[1]/div[${count}]/div/a@style
    \    ${url}=    Fetch From Right      ${attr}    url(
    \    ${url}=    Fetch From Left       ${url}     ?
    \    ${url}=    Remove String         ${url}     "
    \    ${url}=    Catenate     SEPARATOR=     ${url}      ?w=${UNSPLASH_IMAGE_WIDTH}&h=${UNSPLASH_IMAGE_HEIGHT}
    \    Log To Console  ${url}
    \    Download Image '${count}' From '${url}' Into Folder '${test_title}'