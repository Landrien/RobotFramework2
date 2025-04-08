*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/browser_setup.resource
Resource    ../Keywords/Test1.robot
Resource    ../Keywords/Test3.robot
Suite Setup    Setup Browser    chrome
Suite Teardown    Teardown Browser

*** Test Cases ***
Test de la page panier
    [Tags]    POEI20252-744
    SeConnecter
    Ajout d'un produit au panier


