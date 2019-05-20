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
${PRODUCT_LIST} =           css=.product-box .product .prc-picture
${PRODUCT_IMAGE} =          css=img.prc-picture
${PRODUCT_DETAIL_IMAGE} =   css=#product-detail-app .pd-img img
${PRODUCT_BRAND} =          css=.product-info-container .brand
${PRODUCT_NAME} =           css=.product-info-container .name
${PRODUCT_PRICE} =          css=.product-info-container .sale-price


*** Keywords ***
Find Product Images
    #images = driver.find_elements_by_tag_name('img') # For ALL IMAGE
    wait until element is visible  ${PRODUCT_IMAGE}
    : FOR   ${i}    IN RANGE    10
    \   Execute JavaScript      window.scrollBy(0,400)
    \   sleep  0.1
    Execute JavaScript          window.scrollTo(0,0)
    sleep  3

    ${elements}=    Get WebElements     ${PRODUCT_IMAGE}
    ${elm_len}=     get length          ${elements}
    ${prd_imgs}=    create list

    : FOR   ${i}        IN RANGE                ${elm_len}
    \   ${img}          Get Element Attribute   ${elements[${i}]}   src
    \   append to list  ${prd_imgs}             ${img}

    [Return]        ${prd_imgs}

Click Product
    [Arguments]    ${num}=1
    wait until element is visible       ${PRODUCT_LIST}
    ${elements}=    Get WebElements     ${PRODUCT_LIST}
    ${prd_len}=     get length          ${elements}
    ${products}=    Get WebElements     ${PRODUCT_NAME}
    ${ind}=         evaluate            ${num}-1 % ${prd_len}
    ${prd_name}     get text            ${products[${ind}]}
    click element   ${elements[${ind}]}
    #wait_for_loaded()
    [Return]        ${prd_name}
