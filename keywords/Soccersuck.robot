*** Settings ***
Resource       ./DownloadImage.robot

*** Keywords ***
Soccersuck has xcorner section
    Wait Until Element Is Visible                 xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a
    ${x_corner_url}=     Get Element Attribute    xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a@href
    Set Test Variable  ${test_x_corner_url}     ${x_corner_url}

Enter xcorner url '${xcorner_url}'
    Go To  ${xcorner_url}
    @{list_images}=       Get Webelements      //*[@id="container"]/div[6]/div[2]/div[2]//img
    ${total_image}=       Get Length           ${list_images}
    Set Test Variable   ${test_total_image}     ${total_image}
    Set Test Variable   ${test_list_images}     ${list_images}

Download all images from the poster total '${total_image}'
    :FOR    ${count}    IN RANGE    0    ${total_image}
    \    ${image}=     Get From List     ${test_list_images}     ${count}
    \    ${url}=       Set Variable      ${image.get_attribute('src')}
    \    ${gif_array}=     Get Regexp Matches     ${url}     .gif
    \    ${total_gif}=     Get Length             ${gif_array}
    \    Continue For Loop If      '${total_gif}'!='0'
    \    Download Image '${count}' From '${url}' Into Folder '${test_title}'