*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Navigation
#    Set Selenium Speed    3
    Set Selenium Implicit Wait    10

    Open Browser    https://petstore.octoperf.com/actions/Catalog.action    Chrome
    Maximize Browser Window
    Click Link    xpath=//div[@id="Menu"]//descendant::a[2]
    Go Back
    ${TEXT}    Get Text    xpath=//a[text()='Sign In']
    Log To Console   Link is: ${TEXT}
    ${FISH}=   Get WebElement       xpath=//*[@id="QuickLinks"]/a[1]
    Click Link        ${FISH}
    Go Back
    Reload Page
    Execute JavaScript    window.history.forward();

    ${TEXT_DATA}    Get Text    xpath=//div[@id="CTA"]
    Log To Console   Link Data is: ${TEXT_DATA}
    
    ${VALUE}=    get element attribute    xpath=//input[@name='searchProducts']    value
    Log to console  Value is:${VALUE}
#    Go Back

    ${single_link}=    Get WebElement    xpath=//*[@id="Catalog"]//table//tr//td
    Log To Console    Single Link is: ${single_link.text}

    ${links}=    Get WebElements    xpath=//*[@id="Catalog"]//table//tr//td
    FOR    ${link}    IN    @{links}
        Log To Console   Link Text is: ${link.text}
    END


#Common Explicit Wait Keywords:
#Wait Until Element Is Visible
#Wait Until Element Is Enabled
#Wait Until Element Is Clickable
#Wait Until Page Contains
#Wait For Condition
#Wait Until Element Is Not Visible
#Wait For Element State










#*** Settings ***
#Library    SeleniumLibrary
#
#*** Variables ***
#${URL}    https://example.com
#${BUTTON_LOCATOR}    id=submit_button
#
#*** Test Cases ***
#Find And Click Button
#    Open Browser    ${URL}    Chrome
#    ${button}=    Find Element    ${BUTTON_LOCATOR}    10s
#    Click Element    ${button}
#    Close Browser
#
#
#
#
#
#*** Settings ***
#Library    SeleniumLibrary
#
#*** Variables ***
#${URL}    https://example.com
#${LINKS_LOCATOR}    tag name=a
#
#*** Test Cases ***
#Find All Links
#    Open Browser    ${URL}    Chrome
#    ${links}=    Find Elements    ${LINKS_LOCATOR}    10s
#    :FOR    ${link}    IN    ${links}
#    \    Log    ${link.text}
#    Close Browser
