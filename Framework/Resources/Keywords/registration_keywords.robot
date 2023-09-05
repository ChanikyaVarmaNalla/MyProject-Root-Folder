*** Settings ***
Resource    Framework/Resources/Variables/registration_variables.robot
Resource    Framework/Resources/Variables/common_registration_variables.robot

*** Keywords ***
Fill Registration Form 1
    [Arguments]    ${first_name}    ${last_name}    ${phone}    ${email}    ${address}    ${city}    ${state}    ${postal_code}    ${user_name}    ${password}
    Input Text    ${url_first_name}    ${first_name}
    Input Text    ${url_last_name}     ${last_name}
    Input Text    ${url_phone}     ${phone}
    Input Text    ${url1_email}     ${email}
    Input Text    ${url1_address}    ${address}
    Input Text    ${url_city}    ${city}
    Input Text    ${url_state}   ${state}
    Input Text    ${url_postal_code}    ${postal_code}
    Click Element    ${url1_country}
    Click Element    ${url1_country_name}
    Input Text    ${url1_user_name}    ${user_name}
    Input Text    ${url1_password}    ${password}
    Input Text    ${url1_confirm_password}    ${password}

Submit Registration 1
    Click Element    ${url1_submit}



Fill Registration Form 2
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${city}    ${state}    ${zip_code}    ${phone}    ${ssn}    ${user_name}    ${password}
    Input Text    ${url_first_name}    ${first_name}
    Input Text    ${url_last_name}     ${last_name}
    Input Text    ${url2_address}    ${address}
    Input Text    ${url_city}    ${city}
    Input Text    ${url_state}    ${state}
    Input Text    ${url_postal_code}    ${zip_code}
    Input Text    ${url_phone}     ${phone}
    Input Text    ${url2_ssn}     ${ssn}
    Input Text    ${url2_user_name}    ${user_name}
    Input Text    ${url2_password}    ${password}
    Input Text    ${url2_confirm_password}    ${password}

Submit Registration 2
    Click Element    ${url2_register}