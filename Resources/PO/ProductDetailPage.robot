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
${ADD_TO_BASKET} =          css=.pr-in-btn.add-to-bs
${BASKET_ITEM_COUNT} =      id=basketItemCount
${PD_IMG} =                 css=.slick-list .slick-track .pd-img img

*** Keywords ***
Find Product Images
    #images = driver.find_elements_by_tag_name('img') # For ALL IMAGE
    wait until element is visible       ${PD_IMG}
    ${elements}=    Get WebElements     ${PD_IMG}
    ${elm_len}=     get length          ${elements}
    ${prd_imgs}=    create list

    : FOR   ${i}        IN RANGE                ${elm_len}
    \   ${img}          Get Element Attribute   ${elements[${i}]}   src
    \   append to list  ${prd_imgs}             ${img}

    [Return]        ${prd_imgs}

Add To Basket
    #go to   https://www.trendyol.com/fairy/platinum-bulasik-makinesi-deterjani-hizli-cozunme-58-yikama-4-lu-p-4160525
    click button                        ${ADD_TO_BASKET}
    wait until element is visible       ${BASKET_ITEM_COUNT}
    ${element}          Get WebElement  ${BASKET_ITEM_COUNT}
    ${count}            get text        ${element}
    Should be equal     ${count}        1

