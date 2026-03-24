*** Settings ***
Documentation       This is some basic info about the whole suite
Library             SeleniumLibrary

#Run the script:
#robot -d results tests/crm.robot

*** Variables ***


*** Test Cases ***
Should be able to add new customer
    [Documentation]         This is some basic info about the test
    [Tags]                  1006    Smoke   Contacts
    #Initialize Selenium
    Set selenium speed      .2s
    Set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            https://automationplayground.com/crm/       chrome

    #check that the right page is loaded
    Wait until page contains    Customers Are Priority One!

    #load login view
    click link              xpath=//*[@id="SignIn"]
    page should contain    Login
clear    

    sleep               3s
    close browser

*** Keywords ***
