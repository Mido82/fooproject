*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}      chrome
${URL}          https://www.rental2.infotiv.net


*** Test Cases ***


Komma in på hemsidan
    [Documentation]             Test for accessing website infotiv
    [Tags]                      Access_test
    Wait Until Page Contains    Infotiv Car Rental



Logga in med korrekta uppgifter
    [Documentation]             test login with valid credentials
    [Tags]                      testValidLogin
    Input Text                  id:email     ahmed.suleman@iths.se
    Input Password              id:password  hejhej1
    Click Button                id:login
    Wait Until Page Contains    You are signed in as Ahmad




Logga in med fel uppgifter
    [Documentation]             test login with invalid credentials
    [Tags]                      testInvalidLogin

    Input Text                  id:email     fel@gmail.com
    Input Password              id:password  felfel
    Click Button                id:login
    Element Should Be Visible     id:signInError


Logga in med feluppgifter2

    [Documentation]             test login with invalid email and vaild password
    [Tags]                      testInvalidValid

    Input Text                  id:email     fel@gmail.com
    Input Password              id:password  qweasd12
    Click Button                id:login
    Element Should Be Visible     id:signInError



Logga in med feluppgifter3

    [Documentation]             test login with valid email and invaild password
    [Tags]                      testValidInvalid

    Input Text                  id:email     ahmed.suleman@iths.se
    Input Password              id:password  felfel
    Click Button                id:login
    Element Should Be Visible     id:signInError


Testa att logga ut
    [Documentation]                 Test the logout function
    [Tags]                          LogOutTest
    Input Text                          id:email     ahmed.suleman@iths.se
    Input Password                      id:password  hejhej1
    Click Button                        id:login
    Wait Until Page Contains            You are signed in as Ahmad
    Click Button                        id:logout
    Wait Until Page Contains            Login



Test av fel datum

    [Documentation]                     test invalid date in date section
    [Tags]                              testInvalidDate
    Input Text                           id:start  01-07
    Click Button                         id:continue
    Element Should Be Visible           css:#start:invalid


Test av rätt datum

    [Documentation]                     test valid date in date section
    [Tags]                              testValidDate

    Input Text                           id:start  04-03
    Input Text                           id:end    04-04
    Click Button                         id:continue
    Wait Until Page Contains             What would you like to drive?






