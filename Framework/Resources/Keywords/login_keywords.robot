*** Settings ***
Resource    ../../Resources/Variables/login_variables.robot

*** Keywords ***
Click Login 1
    Click Element    ${url1_submit}

Click Login 2
    Click Element    ${url2_submit}
