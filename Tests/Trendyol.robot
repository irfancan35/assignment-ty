*** Settings ***
Documentation  TrendyolTest
Resource    ../Resources/TrendyolApp.robot
Resource    ../Resources/Common.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test

# robot --variable BROWSER:chrome -d Results Tests/Trendyol.robot
# robot --variable BROWSER:headlessfirefox -d Results Tests/Trendyol.robot

*** Test Cases ***
Registered user can login
    TrendyolApp.Load Page
    TrendyolApp.Skip PopUp
    TrendyolApp.Login with Valid User

User should click tabs and check boutique images loaded
    TrendyolApp.Load Page
    TrendyolApp.Skip PopUp
    TrendyolApp.Check Boutique Images under Tabs

User should go to boutique details page and check product images loaded
    TrendyolApp.Load Page   ${URL_BASE}     /butik/liste/supermarket
    TrendyolApp.Go to Boutique  2
    TrendyolApp.Check Product Images in Boutique Detail Page

User should go to product detail page and check product images loaded
    TrendyolApp.Load Page   ${URL_BASE}     /butik/liste/supermarket
    TrendyolApp.Go to Boutique  2
    TrendyolApp.Go to Product Detail    3
    TrendyolApp.Check Product Images in Product Detail Page

User should add and check product in basket
    TrendyolApp.Load Page   ${URL_BASE}     /butik/liste/supermarket
    TrendyolApp.Go to Boutique  2
    ${prd_name}=    Go to Product Detail    3
    TrendyolApp.Add Product into Basket     ${prd_name}

