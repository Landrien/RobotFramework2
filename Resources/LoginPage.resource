*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${locateurUsername}    id=user-name
${locateurPassword}    id=password
${locateurLogin}    id=login-button
${locateurError}    xpath=//h3[@data-test='error']