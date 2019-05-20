*** Settings ***
Documentation  TrendyolTest
Library  Selenium2Library
Library  DebugLibrary
Library  Collections
Library  RequestsLibrary
Library  String
Library  OperatingSystem
Library  String

*** Variables ***
${BOUTIQUE_IMAGES} =        css=img.bigBoutiqueImage
${BOUTIQUE_LIST} =          class=butik-name


*** Keywords ***
Find Boutique Images
    #images = driver.find_elements_by_tag_name('img') # For ALL IMAGE
    wait until element is visible       ${BOUTIQUE_IMAGES}
    ${elements}=    Get WebElements     ${BOUTIQUE_IMAGES}
    ${elm_len}=     get length          ${elements}
    ${btq_imgs}=    create list

    : FOR   ${i}        IN RANGE                ${elm_len}
    \   ${img}          Get Element Attribute   ${elements[${i}]}   data-original
    \   append to list  ${btq_imgs}             ${img}
    [Return]    ${btq_imgs}

Click Boutique
    [Arguments]     ${num}=1
    ${boutiques}=   Get WebElements     ${BOUTIQUE_LIST}
    ${btq_len}=     get length          ${boutiques}
    ${ind}=         evaluate            ${num}-1 % ${btq_len}
    Click Element   ${boutiques[${ind}]}
    #wait_for_loaded()

