*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginPage.resource
Resource    ../Resources/ProductPage.resource

*** Keywords ***
SeConnecter
    Input Text    ${locateurUsername}    standard_user
    Input Text    ${locateurPassword}    secret_sauce
    Click Element    ${locateurLogin}
    Wait Until Element Is Visible    ${locateurtitle}    5s
    Page Should Contain    text=Products