*** Settings ***
Documentation  TrendyolTest
Resource    ../Resources/Common.robot
Resource    ../Resources/PO/Header.robot
Resource    ../Resources/PO/LoginPopUp.robot
Resource    ../Resources/PO/BoutiquesPage.robot
Resource    ../Resources/PO/BoutiqueDetailPage.robot
Resource    ../Resources/PO/ProductDetailPage.robot
Resource    ../Resources/PO/BasketPage.robot

*** Variables ***
${BROWSER} =                Chrome
${URL_BASE} =               https://www.trendyol.com

*** Keywords ***
Load Page
    [Arguments]             ${base}=${URL_BASE}     ${rel_url}=${EMPTY}
    Common.Navigate To      ${base}                 ${rel_url}
    #Common.Skip Popup

Login with Valid User
    Header.Open Login Popup
    LoginPopUp.Login

Go to Tab
    [Arguments]     ${num}=9
    Header.Click Tab            ${num}

Check Boutique Images under Tabs
    : FOR    ${i}    IN RANGE       1       10
    \   Header.Click Tab            ${i}
    \   ${imgs}=    BoutiquesPage.Find Boutique Images
    \   Common.Verify Images Loaded     ${imgs}
    sleep  5

Go to Boutique
    [Arguments]     ${num}=2
    BoutiquesPage.Click Boutique  ${num}

Check Product Images in Boutique Detail Page
    ${imgs}=    BoutiqueDetailPage.Find Product Images
    Common.Verify Images Loaded     ${imgs}

Go to Product Detail
    [Arguments]     ${num}=3
    log to console  ${num}
    ${prd_name}=    BoutiqueDetailPage.Click Product   ${num}
    [Return]    ${prd_name}

Check Product Images in Product Detail Page
    ${imgs}=    ProductDetailPage.Find Product Images
    Common.Verify Images Loaded     ${imgs}

Add Product into Basket
    [Arguments]     ${prd_name}
    ProductDetailPage.Add To Basket
    Header.Go To Basket Page
    BasketPage.Verify Product In Basket    ${prd_name}

User should add product into basket
    log to console  asd

test1
    [Arguments]                 ${env}=${TEST_ENV}      ${base}=${URL_BASE}
    Common.Navigate To          ${env}                  ${base}
    Common.Verify Page Loaded
    Common.Skip Popup
    #Header.Open Login Popup
    #LoginPopUp.Login
    : FOR    ${i}    IN RANGE       1       10
    \   Header.Click Tab            ${i}
    \   ${imgs}=    BoutiquesPage.Find Boutique Images
    #\   Common.Verify Images Loaded     ${imgs}
    sleep  5
    BoutiquesPage.Click Boutique  2
    #${imgs}=    BoutiqueDetailPage.Find Product Images
    ${prd_name}=    BoutiqueDetailPage.Click Product   3
    ProductDetailPage.Add To Basket
    Header.Go To Basket Page
    BasketPage.Verify Product In Basket    ${prd_name}

test2
    Load Page       ${URL_BASE}
    #Login with Valid User
    Check Boutique Images under Tabs
    Check Product Images in Boutique Detail Page    2
    ${prd_name}=    Go to Product Detail    3
    log to console      ${prd_name}
    Check Product Images in Product Detail Page
    Add Product into Basket     ${prd_name}