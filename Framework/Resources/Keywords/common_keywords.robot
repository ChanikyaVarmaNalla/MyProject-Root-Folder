*** Settings ***
Resource    Framework/Resources/Variables/common_login_variables.robot

*** Keywords ***
Close The URL
    Close Browser

Login For URL
    [Arguments]    ${username}    ${password}
    Input Text    ${url_username}    ${username}
    Input Text    ${url_password}    ${password}