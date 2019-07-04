*** Settings ***
Resource    ../technical Layer/front-end.robot

*** Variables ***
${email}
${password}

*** Keywords ***
Ik met deze gebruiker inlog
    Login With User    ${email}    ${password}

Ik met deze gebruiker met verkeerd ${error} tijdens inlog
    Run Keyword If    '${error}' == 'wachtwoord'     Login With User    ${email}    foutWachtwoord
    ...    ELSE IF    '${error}' == 'email'     Login With User    e@mail.nl   ${password}

Uitloggen van bootcamp site
    Logout from bootcamp site

Zal er een foutmelding worden getoond
    Login alert message is shown