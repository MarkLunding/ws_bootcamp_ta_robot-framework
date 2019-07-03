*** Settings ***
Resource    ../middleLayer/studenten.resource

*** Test Cases ***
Login met bestaande gebruiker
    Given Er is een student in de database
    When Ik met deze gebruiker inlog
    Then zal ik de studentenpagina te zien krijgen
    [Teardown]    Sluit de bootcamp site

