*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com

*** Keywords ***
Setup Browser
    [Arguments]    ${browser}
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window

Teardown Browser
    Close Browser
