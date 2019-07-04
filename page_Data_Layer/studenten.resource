*** Settings ***
Resource    ../technical Layer/database.resource
Resource    ../technical Layer/front-end.robot

*** Variables ***
${email}       ${EMPTY}
${password}    ${EMPTY}

*** Keywords ***
Zal ik de studentenpagina te zien krijgen
    Check If Student Page has loaded
