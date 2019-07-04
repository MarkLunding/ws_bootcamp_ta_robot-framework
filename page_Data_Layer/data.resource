*** Settings ***
Resource    ../technical Layer/database.resource

*** Keywords ***
Er is een student in de database
    Connect To ws_bootcampapp-backend
    ${users}    Get Users From Database    role=STUDENT
    Disconnect from ws_bootcampapp-backend
    ${email}    ${password}    Extract Email and Password for user    ${users}    1
    Set Global Variable    ${email}
    Set Global Variable    ${password}