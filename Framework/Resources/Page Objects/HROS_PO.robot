*** Settings ***
Resource    Framework/Resources/Variables/HROS_variables.robot

*** Keywords ***
Open HROS
    Open Browser    ${HROS_URL}    chrome
    Maximize Browser Window

Close HROS
    Close Browser
