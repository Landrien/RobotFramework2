*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/browser_setup.resource
Resource    ../Keywords/Test1.robot
Suite Setup    Setup Browser    chrome
Suite Teardown    Teardown Browser

*** Test Cases ***
Login valid
    SeConnecter
    

