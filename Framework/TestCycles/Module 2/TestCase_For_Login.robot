*** Settings ***
Library    SeleniumLibrary
Resource    Framework/Resources/Keywords/login_keywords.robot
Resource    Framework/Resources/Keywords/common_keywords.robot
Resource    Framework/Resources/Page Objects/loginPO.robot

*** Test Cases ***
Login into URL1
    Open URL1
    Login For URL    ChanikyaVarma    Kingkong@7
    Click Login 1
    Close The URL

Login into URL2
    Open URL2
    Login For URL    ChanikyaVarma    Kingkong@7
    Click Login 2
    Close The URL
