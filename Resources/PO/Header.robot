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
${LOGIN_TAB} =              class=login-register-button-container
${BASKET_TAB} =             css=#myBasketListItem .icon-container
${BOUTIQUE_TABS} =          class=tabLink
${BASKET_SECTION} =         id=basketTemplate


*** Keywords ***
Open Login Popup
    click element   ${LOGIN_TAB}
    sleep  1

Click Tab
    [Arguments]     ${num}=1
    ${tabs}=        Get WebElements     ${BOUTIQUE_TABS}
    ${ind}          evaluate            ${num}-1
    Click Element   ${tabs[${ind}]}
    sleep   3
    #wait_for_loaded()

Go To Basket Page
    click element   ${BASKET_TAB}
    wait until element is visible       ${BASKET_SECTION}
    #debug
