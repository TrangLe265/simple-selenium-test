*** Settings ***
Documentation   This is some basic info about the whole suite
Library         SeleniumLibrary

# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke

    Begin Web Test
    Search for Prodcuts
    Select Products from Search Results
    Add Product to Cart
    Begin Checkout
    End Web Test

*** Keywords ***
Begin Web Test
    Open Browser            about:blank       chrome

Search for Prodcuts
    Go To                       http://www.amazon.com
    Wait Until Page Contains    Search Amazon
    Input Text      id=twotabsearchtextbox    Medicube pdrn
    Click Button    id=nav-search-submit-button
    Wait Until Page Contains    results for "Medicube pdrn"

Select Products from Search Results
    #   (//div[...])[1]//a/h2:
    #       //div: search for anywhere in the document for this div
    #       [1]: takes only the first match of the div with the provided attribute
    #       //a: search for the anchor tag anywhere inside that div
    #       /h2: go one level down (/) and look for header2
    Wait Until Element Is Visible    xpath=(//div[@data-component-type="s-search-result"])[1]//a/h2     timeout=3s
    Click Element                    xpath=(//div[@data-component-type="s-search-result"])[1]//a/h2

Add Product to Cart
    Wait Until Element Is Visible    xpath=//*[@id="add-to-cart-button"]
    Click Button    id=add-to-cart-button
    Wait Until Element Is Visible    xpath=//*[@id="sc-buy-box-ptc-button"]/span/input

Begin Checkout
    Click Button    xpath=//*[@id="sc-buy-box-ptc-button"]/span/input
    Wait Until Page Contains    Sign in or create account

End Web Test
    Close Browser
