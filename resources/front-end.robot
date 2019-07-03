*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login-outLocator}    navbutton
${loginEmailLocator}    email
${loginPasswordLocator}    password
${loginButton}    login

*** Keywords ***
Open Bootcamp Site
    [Arguments]    ${browser}
    Open Browser    http://localhost:4200/home    browser=${browser}
    Wait Until Element Is Visible    //div[@id="header"]

Login With User
    [Arguments]    ${email}    ${password}
    Set Selenium Speed    0.3
    Wait Until Element Is Visible    ${login-outLocator}
    Click Element    ${login-outLocator}
    Input Text    ${loginEmailLocator}    ${email}
    Input Password    ${loginPasswordLocator}    ${password}
    Wait Until Element Is Visible    ${loginButton}
    Click Element    ${loginButton}

Check If Student Page has loaded
    Wait Until Element Is Visible    ${login-outLocator}
    Element Text Should Be    ${login-outLocator}   LOGOUT

Sluit de bootcamp site
    Close All Browsers