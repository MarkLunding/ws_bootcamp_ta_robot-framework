*** Settings ***
Library    DatabaseLibrary

*** Keywords ***
Connect To ws_bootcampapp-backend
    [Documentation]    Connects to the bootcampapp database with PyMySQL
    Connect To Database
    ...    dbapiModuleName=pymysql
    ...    dbName=ws_bootcampapp-backend
    ...    dbUsername=root
    ...    dbPassword=${EMPTY}
    ...    dbHost=localhost
    ...    dbPort=3306

Disconnect from ws_bootcampapp-backend
    [Documentation]    Disconects from the database
    Disconnect From Database

Get Users From Database
    [Arguments]    ${role}=All
    [Documentation]    Returns a list of users in the database.\n
    ...    By default all user will be returned.\n
    ...    Per role is possible: STUDENT, ADMIN, DOCENT, MEDEWERKER
    Table Must Exist    user
    @{result}    Run Keyword If    '${role}' == 'All'    Query    select * from user
    ...    ELSE    Query    select * from user where role="${role}"
    [Return]    @{result}

Extract Email and Password for user
    [Arguments]    ${users}    ${listNr}
    [Documentation]    Gets the email and password from the userslist for the provided user number.
    ${email}    Set Variable    ${users[${listNr}-1][1]}
    ${password}    Set Variable    ${users[${listNr}-1][4]}
    [Return]    ${email}    ${password}
