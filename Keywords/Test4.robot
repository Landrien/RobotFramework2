*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/CartPage.resource
Resource    ../Resources/CheckoutPage.resource

*** Keywords ***
Finalisation de la commande
    Click Element    ${locateurCheckout}
    Page Should Contain    text=Checkout: Your Information
    Input Text    ${locateurFirstName}    John
    Input Text    ${locateurLastName}    Doe
    Input Text    ${locateurPostalCode}    22222
    Click Element    ${locateurContinue}
    Wait Until Page Contains Element    ${locateurFinish}
    Click Element    ${locateurFinish}
    Wait Until Page Contains    text=Thank you for your order!
    Page Should Contain  text=Thank you for your order!