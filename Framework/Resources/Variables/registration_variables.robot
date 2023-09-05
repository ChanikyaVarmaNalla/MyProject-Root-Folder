*** Variables ***
${REGISTRATION_URL1}    https://demo.guru99.com/test/newtours/register.php
${REGISTRATION_URL2}    https://parabank.parasoft.com/parabank/register.htm


${url1_email}   id=userName
${url1_address}     name=address1
${url1_country}     name=country
${url1_country_name}    xpath=//select[@name='country']/option[.='INDIA']
${url1_user_name}   id=email
${url1_password}    name=password
${url1_confirm_password}    name=confirmPassword
${url1_submit}    name=submit



${url2_address}    id=customer.address.street
${url2_ssn}    id=customer.ssn
${url2_user_name}    id=customer.username
${url2_password}     id=customer.password
${url2_confirm_password}    id=repeatedPassword
${url2_register}    xpath://input[@value='Register']
