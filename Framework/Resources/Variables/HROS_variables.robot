*** Variables ***
${HROS_URL}    https://terralogic.paxanimi.ai/home


# Login to the HROS
${Google_Login}    xpath://form[@id='basic']/button[2]
${Email}    id:identifierId
${Next}    xpath://button/span[.='Next']
${pass}    name:Passwd
${Name}    Nalla Chanikya Varma


#${direct_user_name}    id:basic_userEmail
#${direct_password}    id:basic_password
#${direct_button}    xpath://button[@type='submit']


# Top Menu Options
${Top_Menu_Search}    xpath://div[@class='Header___1wPd_']/div[2]/div[1]

${Top_Menu_Quick_Access}    xpath://div[@class='Header___1wPd_']/div[2]/div[2]
${Top_Menu_Quick_Access_Elements}    xpath://div[@class='Header___1wPd_']/div[2]/div[7]/div//li

${Top_Menu_TimeSheets}    xpath://div[@class='Header___1wPd_']/div[2]/div[3]

${Top_Menu_Notifications}    xpath://div[@class='Header___1wPd_']/div[2]/div[4]

${Top_Menu_Themes}    xpath://div[@class='Header___1wPd_']/div[2]/div[5]
${dark}    xpath://span[.='Dark']
${light}   xpath://span[.='Light']

${Top_Menu_Country}    xpath://div[@class='Header___1wPd_']/div[2]/div[6]
${Top_Menu_Country_India}    xpath://ul[@role='group']/li[4]//div/span

${Top_Menu_Profile}    xpath://div[@class='Header___1wPd_']/div[2]/span
${Top_Menu_Profile_Name}   xpath://div[@class='viewProfileInfo___oYIsT']/p[1]

${close_popup}    xpath://button[@class='ant-modal-close']


# Left Menu Options
${Left_Menu_Home}    xpath:(//span[@class='ant-menu-title-content'])[1]
${Left_Menu_Dashboard}    xpath:(//span[@class='ant-menu-title-content'])[2]
${Left_Menu_Directory}    xpath:(//span[@class='ant-menu-title-content'])[3]
${Left_Menu_Onboarding}    xpath:(//span[@class='ant-menu-title-content'])[4]
${Left_Menu_Offboarding}    xpath:(//span[@class='ant-menu-title-content'])[5]
${Left_Menu_TimeSheet}    xpath:(//span[@class='ant-menu-title-content'])[7]
${Left_Menu_Reports}    xpath:(//span[@class='ant-menu-title-content'])[8]


# TimeSheet Filling Variables
${TimeSheet_Daily}    xpath://div[@class='left___1yDzz']/div[1]/label[1]
${TimeSheet_Weekly}    xpath://div[@class='left___1yDzz']/div[1]/label[2]
${TimeSheet_AddTask}    xpath://div[@class='right___IuPRy']/button[3]
${TimeSheet_BackDate}    xpath://div[@class='MyArrowDatePicker']/button[1]
${TimeSheet_CurrentDate}    xpath://div[@class='MyArrowDatePicker']/div
${TimeSheet_NextDate}    xpath://div[@class='MyArrowDatePicker']/button[2]
#${TimeSheet_iFrame}    id:I0_1694062453459
${TimeSheet_StartDate}    xpath://input[@placeholder='Start date']
${TimeSheet_EndDate}    xpath://input[@placeholder='End date']
${TimeSheet_StartTime}    xpath://input[@id='basic_tasks_0_startTime']
${TimeSheet_EndTime}    xpath://input[@id='basic_tasks_0_endTime']
${TimeSheet_Project}    xpath://input[@id='basic_tasks_0_projectId']
${TimeSheet_TaskName}    xpath://input[@id='basic_tasks_0_taskName']
${TimeSheet_TaskDescription}    xpath://textarea[@id='basic_tasks_0_notes']
${TimeSheet_SubmitButton}    xpath://div[@class='footer___2ao1m']/button[2]

${TimeSheet_TaskUpdate}    xpath://div[@class='actionsButton___12SV-']/img[1]
${TimeSheet_TaskUpdate_Description}    xpath://textarea[@id='basic_notes']
${TimeSheet_TaskUpdate_Button}    xpath://button[.='Update']

${TimeSheet_TaskDelete}    xpath://div[@class='actionsButton___12SV-']/img[3]
${TimeSheet_TaskDelete_Yes}    xpath://button[@type='submit']
