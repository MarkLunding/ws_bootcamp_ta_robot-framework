*** Settings ***
Resource    ../page_Data_Layer/data.resource
Resource    ../page_Data_Layer/home.resource
Resource    ../page_Data_Layer/login.resource
Resource    ../page_Data_Layer/studenten.resource

Suite Setup    Open de bootcamp home pagina met Chrome
Suite Teardown    Sluit de bootcamp site

*** Test Cases ***
Login met bestaande gebruiker
    Given Er is een student in de database
    When Ik de login pagina open
    And Ik met deze gebruiker inlog
    Then zal ik de studentenpagina te zien krijgen
    [Teardown]    Uitloggen van bootcamp site

Login met verkeerd wachtwoord
    Given Er is een student in de database
    When Ik de login pagina open
    And Ik met deze gebruiker met verkeerd wachtwoord tijdens inlog
    Then Zal er een foutmelding worden getoond

Login met verkeerd emailadres
    Given Er is een student in de database
    When Ik de login pagina open
    And Ik met deze gebruiker met verkeerd email tijdens inlog
    Then Zal er een foutmelding worden getoond
