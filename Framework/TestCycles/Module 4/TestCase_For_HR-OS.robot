*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    Framework/Resources/Keywords/HROS_keywords.robot
Resource    Framework/Resources/Page Objects/HROS_PO.robot

*** Test Cases ***
Login To HROS
	[Tags]    login
    Open HROS
    Login HROS    chanikya.varma@terralogic.com    Hiddenleaf@7
    Validate Login