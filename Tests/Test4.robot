*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/browser_setup.resource
Resource    ../Keywords/Test1.robot
Resource    ../Keywords/Test3.robot
Resource    ../Keywords/Test4.robot
Suite Setup    Setup Browser    chrome
Suite Teardown    Teardown Browser

*** Test Cases ***
Test d'achat complet
    Se Connecter
    Ajout d'un produit au panier
    Finalisation de la commande


