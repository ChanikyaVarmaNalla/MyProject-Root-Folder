*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Resource    ../../Resources/Variables/HROS_variables.robot

*** Keywords ***
Login HROS
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${Google_Login}    15s
    Click Element    ${Google_Login}
    Sleep    3
    ${handles}    Get Window Handles
    Switch Window    ${handles}[1]
    Input Text    ${Email}    ${username}
    Click Element    ${Next}
    Sleep    3
    Input Text    ${pass}    ${password}
    Click Element    ${Next}
    Sleep   35
    Switch Window    ${handles}[0]


Validate Login
	Wait Until Element Is Visible    ${Top_Menu_Profile}
    Page Should Contain Element    ${Top_Menu_Profile}
    Log To Console    ${\n}HR-OS Login Successful
    Click Element    ${Top_Menu_Profile}
    Sleep    3


Check Top Options
	# Search
    Wait Until Element Is Enabled    ${Top_Menu_Search}
    Click Element    ${Top_Menu_Search}
    Log To Console    ${\n}Search Option from the Top Menu is working
    Sleep    3
    # Refresh the page using JavaScript
    Execute JavaScript    location.reload(true)

    # Quick Access
    Wait Until Element Is Visible    ${Top_Menu_Quick_Access}
    Mouse Over    ${Top_Menu_Quick_Access}
    Sleep    3
    ${Quick_Access_List}    Get WebElements    ${Top_Menu_Quick_Access_Elements}
    ${Quick_Access_Length}    Get Element Count    ${Top_Menu_Quick_Access_Elements}
    FOR    ${i}    IN    @{Quick_Access_List}
        Log To Console    ${i.text}
    END
    Log To Console    ${\n}All the Quick Access Options are working

    # TimeSheet
    Wait Until Element Is Visible    ${Top_Menu_TimeSheets}
    Click Element    ${Top_Menu_Search}
    Sleep    3
    Log To Console    ${\n}TimeSheet Option from the Top Menu is working
    Execute JavaScript    location.reload(true)

    # Notifications
    Wait Until Element Is Visible    ${Top_Menu_Notifications}
    Click Element    ${Top_Menu_Notifications}
    Sleep    3
    Click Element    ${close_popup}
    Sleep    3
    Log To Console    ${\n}Notifications Option from the Top Menu is working

    # Themes
    Wait Until Element Is Visible    ${Top_Menu_Themes}
    Click Element    ${Top_Menu_Themes}
    Sleep    3
    FOR    ${i}    IN RANGE    0   2
    	Click Element    ${dark}
    	Sleep    3
    	Click Element    ${light}
    END
    Click Element    ${close_popup}
    Log To Console    ${\n}Themes Option from the Top Menu is working
    
    # Country
    Wait Until Element Is Visible    ${Top_Menu_Country}
    Click Element    ${Top_Menu_Country}
    Sleep    3
    Click Element    ${Top_Menu_Country_India}
    Log To Console    ${\n}Country Option from the Top Menu is working
    Sleep    3

    # Profile
    Wait Until Element Is Visible    ${Top_Menu_Profile}
    Click Element    ${Top_Menu_Profile}
    Sleep    3
    ${name}    Get Text    ${Top_Menu_Profile_Name}
    Log To Console    ${\n}${name}
    Log To Console    ${\n}Profile Option is working
    Log To Console    ${\n}All the Top Menu Options are working correctly

Check Left Options
    # Home Button
    Mouse Over    ${Left_Menu_Home}
    Click Element    ${Left_Menu_Home}
    Sleep    3

    # Dashboard Button
    Mouse Over    ${Left_Menu_Dashboard}
    Click Element    ${Left_Menu_Dashboard}
    Sleep    3

    # Directory Button
    Mouse Over    ${Left_Menu_Directory}
    Click Element    ${Left_Menu_Directory}
    Sleep    5

    # Onboarding Button
    Mouse Over    ${Left_Menu_Onboarding}
    Click Element    ${Left_Menu_Onboarding}
    Sleep    3

    # Offboarding Button
    Mouse Over    ${Left_Menu_Offboarding}
    Click Element    ${Left_Menu_Offboarding}
    Sleep    3

    # TimeSheet Button
    Mouse Over    ${Left_Menu_TimeSheet}
    Click Element    ${Left_Menu_TimeSheet}
    Sleep    3

    # Reports Button
    Mouse Over    ${Left_Menu_Reports}
    Click Element    ${Left_Menu_Reports}
    Sleep    3


Get the Dates
    ${Today_Date}=    Get Current Date    result_format=%Y-%m-%d
    ${year}=    Convert To String    ${Today_Date.split('-')[0]}
    ${month}=    Convert To String    ${Today_Date.split('-')[1]}
    ${day}=    Convert To Integer    ${Today_Date.split('-')[2]}
    ${date_list}=    Create List
    WHILE    len(${date_list}) < 7
            ${day_len}=    Evaluate    len('${day}')
            IF    ${day_len} < 2
                Append To List    ${date_list}    ${year}-${month}-0${day}
            ELSE
                Append To List    ${date_list}    ${year}-${month}-${day}
            END
        ${day}=    Evaluate    ${day} + 1
        ${Today_Date}=    Set Variable    ${year}-${month}-${day}
    END
    [Return]    ${date_list}


Fill Time Sheet for a week on Daily basis
	[Arguments]    ${fromtime}    ${totime}    ${project}    ${task}    ${description}
	Wait Until Element Is Visible    ${Left_Menu_TimeSheet}
	Mouse Over    ${Left_Menu_TimeSheet}
	Click Element    ${Left_Menu_TimeSheet}
	Sleep    10
    ${dates}    Get The Dates
    FOR    ${i}    IN    @{dates}
    	Set Selenium Speed    2s
    	Mouse Over    ${TimeSheet_AddTask}
        Click Element    ${TimeSheet_AddTask}
        Click Element    ${TimeSheet_StartDate}
        Press Keys    ${TimeSheet_StartDate}    ${i}    ENTER
        Press Keys    ${TimeSheet_EndDate}     ${i}    ENTER
        Press Keys    ${TimeSheet_StartTime}    ${fromtime}    ENTER
        Press Keys    ${TimeSheet_EndTime}    ${totime}    ENTER
        Press Keys    ${TimeSheet_Project}    ${project}    ENTER
        Press Keys    ${TimeSheet_TaskName}    ${task}
        Click Element    ${TimeSheet_TaskDescription}
        Input Text    ${TimeSheet_TaskDescription}    ${description}
        Click Element    ${TimeSheet_SubmitButton}
        Sleep    3
    END

Fill Time Sheet for a week on Weekly basis
	[Arguments]    ${fromtime}    ${totime}    ${project}    ${task}    ${description}
	Wait Until Element Is Visible    ${Left_Menu_TimeSheet}
	Mouse Over    ${Left_Menu_TimeSheet}
	Click Element    ${Left_Menu_TimeSheet}
	Sleep    10
    ${dates}    Get The Dates
    Set Selenium Speed    2s
    Click Element    ${TimeSheet_AddTask}
    Click Element    ${TimeSheet_StartDate}
    Press Keys    ${TimeSheet_StartDate}    ${dates}[0]    ENTER
    Press Keys    ${TimeSheet_EndDate}     ${dates}[-1]    ENTER
    Press Keys    ${TimeSheet_StartTime}    ${fromtime}    ENTER
    Press Keys    ${TimeSheet_EndTime}    ${totime}    ENTER
    Press Keys    ${TimeSheet_Project}    ${project}    ENTER
    Press Keys    ${TimeSheet_TaskName}    ${task}
    Click Element    ${TimeSheet_TaskDescription}
    Input Text    ${TimeSheet_TaskDescription}    ${description}
    Click Element    ${TimeSheet_SubmitButton}
    Sleep    3

Update Newly Created TimeSheet For Daily
    [Arguments]    ${new_description}
    Wait Until Element Is Visible    ${Left_Menu_TimeSheet}
    Mouse Over    ${Left_Menu_TimeSheet}
    Click Element    ${Left_Menu_TimeSheet}
    Sleep    10
    Set Selenium Speed    2s
    Mouse Over    ${TimeSheet_TaskUpdate}
    Click Element    ${TimeSheet_TaskUpdate}
    Click Element    ${TimeSheet_TaskUpdate_Description}
    Input Text    ${TimeSheet_TaskUpdate_Description}    ${new_description}
    Click Element    ${TimeSheet_TaskUpdate_Button}
    Sleep    5

Update Newly Created TimeSheet For Weekly
	[Arguments]    ${new_description}
	Wait Until Element Is Visible    ${Left_Menu_TimeSheet}
    Mouse Over    ${Left_Menu_TimeSheet}
    Click Element    ${Left_Menu_TimeSheet}
    Sleep    10
    ${days}    Get The Dates
    FOR    ${i}    IN    @{days}
    	Set Selenium Speed    3s
        Click Element    ${TimeSheet_TaskUpdate}
        Click Element    ${TimeSheet_TaskUpdate_Description}
        Input Text    ${TimeSheet_TaskUpdate_Description}    ${new_description}
        Click Element    ${TimeSheet_TaskUpdate_Button}
        Sleep    15
        Click Element    ${TimeSheet_NextDate}
    END


Delete Newly Created TimeSheet For Daily
	Wait Until Element Is Visible    ${Left_Menu_TimeSheet}
    Mouse Over    ${Left_Menu_TimeSheet}
    Click Element    ${Left_Menu_TimeSheet}
    Sleep    10
    Set Selenium Speed    2s
    Click Element    ${TimeSheet_TaskDelete}
    Click Element    ${TimeSheet_TaskDelete_Yes}


Delete Newly Created TimeSheet For Weekly
    Wait Until Element Is Visible    ${Left_Menu_TimeSheet}
    Mouse Over    ${Left_Menu_TimeSheet}
    Click Element    ${Left_Menu_TimeSheet}
    Sleep    10
    ${days}    Get The Dates
    FOR    ${i}    IN   @{days}
    	Set Selenium Speed    3s
    	Mouse Over    ${TimeSheet_TaskDelete}
        Click Element    ${TimeSheet_TaskDelete}
        Mouse Over    ${TimeSheet_TaskDelete_Yes}
        Click Element    ${TimeSheet_TaskDelete_Yes}
        Mouse Over    ${TimeSheet_NextDate}
        Click Element    ${TimeSheet_NextDate}
    END
