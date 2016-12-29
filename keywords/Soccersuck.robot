*** Settings ***
Resource       ./DownloadImage.robot

*** Keywords ***
Soccersuck has xcorner section
    Wait Until Element Is Visible                 xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a
    ${x_corner_url}=     Get Element Attribute    xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a@href
    Set Test Variable  ${test_x_corner_url}     ${x_corner_url}

Enter xcorner url '${xcorner_url}'
    Go To  ${xcorner_url}
    ${total_image}=     Get Matching Xpath Count    //*[@id="container"]/div[6]/div[2]/div[2]/img
    Set Test Variable   ${test_total_image}     ${total_image}

Download all images from the poster total '${total_image}'
    :FOR    ${count}    IN RANGE    1    ${total_image}
    \    ${url}=       Get Element Attribute     //*[@id="container"]/div[6]/div[2]/div[2]/img[${count}]@src
    \    log     ${url}
    \    Download Image '${count}' From '${url}' Into Folder '${test_title}'