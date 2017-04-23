*** Settings ***
Resource       ./DownloadImage.robot

*** Keywords ***
Soccersuck has xcorner section
    Wait Until Element Is Visible                 xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a
    ${x_corner_url}=     Get Element Attribute    xpath=//*[@id="container"]/div[2]/div[32]/div[3]/div[1]/a@href
    Set Test Variable  ${test_x_corner_url}     ${x_corner_url}

Enter xcorner url '${xcorner_url}' Or '${custom_url}'
    ${url}=     Set Variable If     '${custom_url}'!='custom_url'      ${custom_url}
    ${url}=     Set Variable If     '${custom_url}'=='custom_url'      ${xcorner_url}
    Log To Console        Loading image url from url ${url}
    Go To       ${url}
    @{list_images}=       Get Webelements      //div[@id="container"]/div[@class="post_panel"][1]/div[@class="post_panel_td post_panel_td_right"]/div[@class="post_desc"]//img
    ${total_image}=       Get Length           ${list_images}
    Set Test Variable   ${test_total_image}     ${total_image}
    Log To Console   Total images is ${test_total_image}
    Set Test Variable   ${test_list_images}     ${list_images}

Download all images from the poster total '${total_image}'
    :FOR    ${count}    IN RANGE    0    ${total_image}
    \    ${image}=     Get From List     ${test_list_images}     ${count}
    \    ${url}=       Set Variable      ${image.get_attribute('src')}
    \    ${path}     ${extension}=     Split Extension     ${url}
    \    Log To Console    Download image ${count} of ${total_image}
    \    Continue For Loop If      '${extension}'=='gif'
    \    Download Image '${count}' From '${url}' Into Folder '${test_title}'
