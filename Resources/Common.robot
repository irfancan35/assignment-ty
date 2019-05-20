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
${BROWSER} =                Chrome
${BASE_URL} =               https://www.trendyol.com
${CLOSE_POPUP} =            class=fancybox-close

*** Keywords ***
Begin Web Test
    [Arguments]                 ${brw}=${BROWSER}
    Open Browser                about:blank     ${brw}
    maximize browser window

End Web Test
    Close Browser

Navigate To
    [Arguments]     ${base}=${BASE_URL}     ${rel_url}=${EMPTY}
    ${url}=         set variable            ${base}${rel_url}
    go to           ${url}

Verify Page Loaded
    #wait until page contains element  ${LANDING_NAVIGATION_ELEMENT}
    log to console  XXX

Skip Popup
    click element  ${CLOSE_POPUP}
    sleep  1

Verify Images Loaded
    [Arguments]     ${imgs}
    ${unq_imgs}=    remove duplicates       ${imgs}
    ${img_len}=     get length              ${unq_imgs}
    : FOR   ${i}        IN RANGE            ${img_len}
    \   Is URL Loaded   ${unq_imgs[${i}]}

Is URL Loaded
    [Arguments]     ${url}
    ${proxies}=     Create Dictionary   http=${EMPTY}           https=${EMPTY}
    ${str}=         replace string      ${url}                  .com/               .com /
    @{words}=       split string        ${str}                  ${EMPTY}
    Create Session  trendyol            ${words[0]}             proxies=${proxies}  disable_warnings=1
    ${resp}=        Get Request         trendyol                ${words[1]}
    Should Be Equal As Strings          ${resp.status_code}     200
