*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://www.w3schools.com/html/html_tables.asp
${BROWSER}     chrome

*** Test Cases ***

Open Browser And Navigate
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Static Webtable
    ${rows}=    Get Element Count    xpath=//table[@id='customers']/tbody/tr
    FOR    ${index}    IN RANGE    1    ${rows}+1
    ${row_data}=    Get Text    xpath=//table[@id='tableID']/tbody/tr[${index}]
    Log    ${row_data}

Dynamic Web Table
    ${row_count}=    Get Element Count    xpath=//table[@id='tableID']/tbody/tr
    FOR    ${i}    IN RANGE    1    ${row_count}+1
    ${cell}=    Get Text    xpath=//table[@id='tableID']/tbody/tr[${i}]/td[2]
    Run Keyword If    '${cell}' == 'TargetValue'    Log    Found in Row ${i}

Mouse Hover Action
    Mouse Over    xpath=//div[@id='hover-element']

Right Click Action
    Open Context Menu    xpath=//div[@id='right-click-area']

Double Click Action
    Double Click Element    xpath=//button[@id='double-click']

Drag And Drop Example
    Drag And Drop    xpath=//div[@id='source']    xpath=//div[@id='target']

Slider Drag Example
    Execute JavaScript    document.getElementById('slider').value=70

Scrolling Web Page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Keyboard Actions
    Press Keys    xpath=//input[@id='text-input']    CTRL+A
    Press Keys    xpath=//input[@id='text-input']    BACKSPACE

Bootstrap Dropdown
    Click Element    xpath=//button[@id='dropdownMenuButton']
    Click Element    xpath=//a[text()='Option 2']

Take Screenshot
    Capture Page Screenshot

Close Test
    Close Browser
