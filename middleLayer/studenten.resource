*** Settings ***
Resource    ../resources/database.resource
Resource    ../resources/front-end.robot

*** Variables ***
${email}       ${EMPTY}
${password}    ${EMPTY}


*** Keywords ***
Er is een student in de database
    Connect To ws_bootcampapp-backend
    ${users}    Get Users From Database    role=STUDENT
    ${email}    ${password}    Extract Email and Password for user    ${users}    1
    Set Suite Variable    ${email}
    Set Suite Variable    ${password}

Ik met deze gebruiker inlog
    Open Bootcamp Site    firefox
    Login With User    ${email}    ${password}


Zal ik de studentenpagina te zien krijgen
    Check If Student Page has loaded

