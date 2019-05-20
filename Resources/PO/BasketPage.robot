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
${BASKET_PRODUCT_INFO} =    css=#basketContent .basketlist-productinfo-description


*** Keywords ***
Verify Product In Basket
    [arguments]     ${prd_name}
    wait until element is visible       ${BASKET_PRODUCT_INFO}
    ${elements}=    Get WebElements     ${BASKET_PRODUCT_INFO}
    ${elm_len}=     get length          ${elements}
    @{prds}=        create list
    : FOR   ${i}        IN RANGE                ${elm_len}
    \   ${prd_info}     Get Element Attribute   ${elements[${i}]}   title
    \   append to list  ${prds}                 ${prd_info}
    should contain      ${prds}         ${prd_name}
