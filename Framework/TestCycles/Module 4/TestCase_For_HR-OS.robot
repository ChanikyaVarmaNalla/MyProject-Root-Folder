*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../Resources/Keywords/HROS_keywords.robot
Resource    ../../Resources/Page Objects/HROS_PO.robot

*** Test Cases ***
Login To HROS
	[Tags]    login
    Open HROS
    Login HROS    chanikya.varma@terralogic.com    Hiddenleaf@7
    Validate Login

Fill TimeSheet Daily
    Fill Time Sheet For A Week On Daily Basis    9:00 am    6:00 pm    Rampup_S    UI Automation    Worked on Automation Task.
    Delete Newly Created TimeSheet For Weekly

Fill TimeSheet Weekly
	Fill Time Sheet For A Week On Weekly Basis    9:00 am    6:00 pm    Rampup_S    UI Automation    Worked on Automation Task.

Update TimeSheet Daily And Weekly
#	Update Newly Created TimeSheet For Daily    Worked on Automation Assignments.
    Update Newly Created TimeSheet For Weekly    Worked on Automation Assignments.

Delete TimeSheet Daily And Weekly
#    Delete Newly Created TimeSheet For Daily
    Delete Newly Created TimeSheet For Weekly