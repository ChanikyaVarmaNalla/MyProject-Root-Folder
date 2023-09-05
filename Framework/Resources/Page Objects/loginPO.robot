*** Settings ***
Library    SeleniumLibrary
Resource    Framework/Resources/Variables/login_variables.robot

*** Keywords ***
Open URL1
    Open Browser    ${LOGIN_URL1}   chrome
    Maximize Browser Window

Open URL2
    Open Browser    ${LOGIN_URL2}   chrome
    Maximize Browser Window
