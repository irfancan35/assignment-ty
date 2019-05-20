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
# LoginPopUpLocator(object):
${EMAIL} =                  id=email
${PASSWORD} =               id=password
${LOGIN_BUTTON} =           id=loginSubmit
${USER_EMAIL} =             test.trendyol@yopmail.com
${USER_PASSWORD} =          123456

*** Keywords ***
Login
    [Arguments]     ${usr_mail}=${USER_EMAIL}   ${usr_pass}=${USER_PASSWORD}
    #wait until element is visible  ${EMAIL}
    input text      ${EMAIL}        ${usr_mail}
    input password  ${PASSWORD}     ${usr_pass}
    click element   ${LOGIN_BUTTON}
    #check success
    #wait_for_loaded()

