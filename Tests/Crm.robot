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
    click link                 xpath=//*[@id="SignIn"]
    page should contain        Login

    #login with valid credentials
    input text                id=email-id    admin@robotframeworktutorial.com
    input text                id=password    admin123
    click button              id=submit-id

    #load customers view
    page should contain       Our Happy Customers

    #load add new customer view
    click link                id=new-customer
    page should contain       Add Customer

    #add new customer with valid data
    input text               id=EmailAddress    johndoe@gmail.com
    input text               id=FirstName       John
    input text               id=LastName        Doe
    input text               id=City            New York
    select from list by value       id=StateOrRegion            NY
    select radio button             gender                      male
    select checkbox                 name=promos-name
    click button                    Submit
    wait until page contains        Success! New customer added.
    
clear        

    sleep               3s
    close browser

*** Keywords ***
