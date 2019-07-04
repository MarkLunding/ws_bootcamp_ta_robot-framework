*** Settings ***
Resource    ../technical Layer/front-end.robot

*** Keywords ***
Open de bootcamp home pagina met ${browser}
    Open Bootcamp Site    ${browser}

sluit de bootcamp site
    Close Bootcamp site

Ik de login pagina open
    Open Login page