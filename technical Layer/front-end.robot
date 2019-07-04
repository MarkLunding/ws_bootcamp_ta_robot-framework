*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login-outLocator}    navbutton
${loginEmailLocator}    email
${loginPasswordLocator}    password
${loginButton}    login

*** Keywords ***
Open Bootcamp Site
    [Documentation]    opens the webpage on localhost with the provided browser
    [Arguments]    ${browser}
    Open Browser    http://localhost:4200/home    browser=${browser}
    Wait Until Element Is Visible    header

Close Bootcamp site
    [Documentation]    Close the web page.
    Close All Browsers

Open Login page
    Wait Until Element Is Visible    ${login-outLocator}
    Click Element    ${login-outLocator}

Login With User
    [Documentation]    Login with the provided credentials
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${loginEmailLocator}
    Input Text    ${loginEmailLocator}    ${email}
    Input Password    ${loginPasswordLocator}    ${password}
    Wait Until Element Is Visible    ${loginButton}
    Click Element    ${loginButton}

Login alert message is shown
    Alert Should Be Present    Het ingevoerde wachtwoord of emailadres is fout, probeer het nog een keer
    Go To    http://localhost:4200/home

Check If Student Page has loaded
    [Documentation]    used to make sure that the student page has loaded
    Wait Until Element Is Visible    ${login-outLocator}
    Element Text Should Be    ${login-outLocator}   LOGOUT

Logout from bootcamp site
    Wait Until Element Is Visible    ${login-outLocator}
    Click Element    ${login-outLocator}

