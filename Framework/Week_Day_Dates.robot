*** Settings ***
Library    DateTime
Library    Collections

*** Test Cases ***
Get the Dates
    ${Today_Date}=    Get Current Date    result_format=%Y-%m-%d
    ${year}=    Convert To String    ${Today_Date.split('-')[0]}
    ${month}=    Convert To String    ${Today_Date.split('-')[1]}
    ${day}=    Convert To Integer    ${Today_Date.split('-')[2]}
    ${date_list}=    Create List
    ${day_of_week}=    Evaluate    datetime.datetime.strptime('${Today_Date}', '%Y-%m-%d').strftime('%A')
    WHILE    len(${date_list}) < 7
        IF    '${day_of_week}' not in ['Saturday', 'Sunday']
            ${day_len}=    Evaluate    len('${day}')
            IF    ${day_len} < 2
                Append To List    ${date_list}    ${year}-${month}-0${day}
            ELSE
                Append To List    ${date_list}    ${year}-${month}-${day}
            END
        END
        ${day}=    Evaluate    ${day} + 1
        ${Today_Date}=    Set Variable    ${year}-${month}-${day}
        ${day_of_week}=    Evaluate    datetime.datetime.strptime('${Today_Date}', '%Y-%m-%d').strftime('%A')
    END
    Log To Console    ${\n}${date_list}
    ${Len}    Get Length    ${date_list}
#    FOR    ${i}     IN RANGE    0    ${Len}
#    	Log To Console    ${date_list}[${i}]
#    END
    ${d}    Get Current Date    result_format=%d
    ${da}    Convert To Integer    ${d}
    ${days}    Create List
    WHILE    len(${days}) < 7
    	${day_len}=    Evaluate    len('${da}')
        IF    ${day_len} < 2
            Append To List    ${days}    0${da}
        ELSE
        	${daa}    Convert To String    ${da}
            Append To List    ${days}    ${daa}
        END
        ${da}    Evaluate    ${da} + 1
    END
    Log To Console    ${days}
