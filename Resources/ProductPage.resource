*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${locateurtitle}    css=.title
${locateurAddProduct}    id=add-to-cart-sauce-labs-backpack
${locateurelementPanier}    xpath=//a/span[@class='shopping_cart_badge']
${locateurPanier}    id=shopping_cart_container
