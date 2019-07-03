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
    [Documentation]    opens the webpage on localhost with the provided browser
    Open Browser    http://localhost:4200/home    browser=${browser}
    Wait Until Element Is Visible    //div[@id="header"]

Login With User
    [Arguments]    ${email}    ${password}
    [Documentation]    Login with the provided credentials
    Wait Until Element Is Visible    ${login-outLocator}
    Click Element    ${login-outLocator}
    Input Text    ${loginEmailLocator}    ${email}
    Input Password    ${loginPasswordLocator}    ${password}
    Wait Until Element Is Visible    ${loginButton}
    Click Element    ${loginButton}

Check If Student Page has loaded
    [Documentation]    used to make sure that the student page has loaded
    Wait Until Element Is Visible    ${login-outLocator}
    Element Text Should Be    ${login-outLocator}   LOGOUT

Sluit de bootcamp site
    [Documentation]    Close the web page
    Close All Browsers