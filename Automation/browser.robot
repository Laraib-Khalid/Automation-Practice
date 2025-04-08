*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Open and Close Browser
    Open Browser    https://designer.mocky.io/      headlessChrome
    Maximize Browser Window
    Open Browser    https://petstore.octoperf.com/actions/Account.action?newAccountForm=    headlessChrome
    Maximize Browser Window
    Close All Browsers

Open and Switch Browser
    Open Browser     https://petstore.octoperf.com/actions/Account.action?newAccountForm=     headlessChrome
    Maximize Browser Window
    Open Browser    https://designer.mocky.io/      headlessChrome
    Maximize Browser Window
    Switch Browser    1
