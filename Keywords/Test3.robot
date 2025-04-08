*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/ProductPage.resource
Resource    ../Resources/CartPage.resource

*** Keywords ***
Ajout d'un produit au panier 
    Wait Until Element Is Visible    ${locateurtitle}    5s
    Click Element    ${locateurAddProduct}
    Wait Until Element Is Visible    ${locateurelementPanier}    5s
    Page Should Contain Element    ${locateurelementPanier}
    Click Element    ${locateurPanier}
    Page Should Contain    text=Your Cart
    Page Should Contain Element    ${locateurProduct}