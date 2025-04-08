*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/browser_setup.resource
Resource    ../Resources/LoginPage.resource
Resource    ../Resources/ProductPage.resource
Suite Setup    Setup Browser    chrome
Suite Teardown    Teardown Browser

*** Test Cases ***
Login invalid
    [Tags]    POEI20252-743
    Input Text    ${locateurUsername}    standard_user
    Input Text    ${locateurPassword}    secret_sauce1
    Click Element    ${locateurLogin}
    Wait Until Element Is Visible    ${locateurError}    5s
    Page Should Contain Element    ${locateurError}
    Page Should Contain    text=Epic sadface: Username and password do not match any user in this service