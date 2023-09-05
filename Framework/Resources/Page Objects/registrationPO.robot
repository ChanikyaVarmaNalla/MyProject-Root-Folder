*** Settings ***
Library    SeleniumLibrary
Resource    Framework/Resources/Variables/registration_variables.robot

*** Keywords ***
Open Registration Page 1
    Open Browser    ${REGISTRATION_URL1}    Chrome
    Maximize Browser Window

Open Registration Page 2
    Open Browser    ${REGISTRATION_URL2}    Chrome
    Maximize Browser Window
