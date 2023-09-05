*** Settings ***
Library    SeleniumLibrary
Resource    Framework/Resources/Page Objects/registrationPO.robot
Resource    Framework/Resources/Keywords/registration_keywords.robot
Resource    Framework/Resources/Keywords/common_keywords.robot

*** Test Cases ***
Test Registration 1 of url 1
    Open Registration Page 1
    Fill Registration Form 1   Chanikya    Varma    8985873519    nchanikyavarma04@gmail.com    my home, my road, my area    Guntur    AP    522509    ChanikyaVarma    Kingkong@7
    Submit Registration 1
    Close The URL

Test Registration 1 of url 2
    Open Registration Page 2
    Fill Registration Form 2   Chanikya    Varma    my home, my road, my area    Guntur    AP    522509    8985873519    mySSN    ChanikyaVarma    Kingkong@7
    Submit Registration 2
    Close The URL