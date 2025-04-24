*** Settings ***
Library     SeleniumLibrary
Library    Collections
Library    XML

*** Variables ***

*** Keywords ***


*** Test Cases ***
Test Case 1: Open Browser
    Open Browser    https://testautomationpractice.blogspot.com/    Chrome
    Maximize Browser Window
    Page Should Contain    Automation Testing Practice

Test Case 2: Enter Text Field
    Input Text    xpath=//input[@id='name']    Laraib Khalid
    Input Text    id=email    laraib@bssuniversal.com
    Input Text    id=phone    0123456789
    Input Text    id=textarea    Lahore

Test Case 3: Select Radio Button
    Select Radio Button    gender    value=female

Test Case 4: Select Checkbox
    Select Checkbox    id=sunday
    Select Checkbox    id=tuesday
    Select Checkbox    id=thursday

Test Case 5: Select Dropdown
    Select From List By Value    id=country     france

Test Case 6: Select Multi-Select List
    Select From List By Value    id=colors    red   green   blue
#    Select All From List    id=colors

Test Case 7: Check Animal List Is Sorted
    ${animals}      Get List Items    id=animals
    ${sorted_animals}   Copy List    ${animals}
    Sort List    ${animals}
    Log To Console    Animals List is ${animals}
    Log To Console    Sorted Animals List is ${sorted_animals}
    Should Be Equal    ${animals}    ${sorted_animals}
    
Test Case 8: Select All Values From List
    Select All From List    id=animals

Test Case 9: Enter Specific Date
#    Input Text    id=datepicker    05/23/2025
    Click Element    id=datepicker
    Click Element    xpath=//a[@data-date="21"]
Test Case 10: Select Date From Calendar
    Click Element    id=txtDate
    Select From List By Label    xpath=//select[@class="ui-datepicker-month"]       Nov
    Select From List By Label    xpath=//select[@class="ui-datepicker-year"]    2015
    Click Element    xpath=//a[@data-date="19"]

Test Case 11: Enter Specific Start Date
#    Click Element    id=start-date
#    Click Element    xpath=//button[contains(@aria-label,'choose year')]   # open year selector
#    Click Element    xpath=//span[text()='1990']                    # select year
#    Click Element    xpath=//span[text()='Nov']                     # select month
#    Click Element    xpath=//button[text()='26']                    # select day
    Input Text    id=start-date    11
    Input Text    id=start-date    26
    Input Text    id=start-date    1990

Test Case 11: Enter Specific End Date
    Input Text    id=end-date    12
    Input Text    id=end-date    26
    Input Text    id=end-date    2025
    
    
Test Case 12: Press Button
    Click Button    class=submit-btn
    Wait Until Element Contains    id=result    You selected a range of      10s

Test Case 13: Select Single File
    Choose File    id=singleFileInput    C:/Users/LaraibKhalid/Downloads/Login_Data.xlsx
    Click Button    xpath=//form[@id="singleFileForm"]/child::button[@type="submit"]

Test Case 14: Select Multiple Files
    ${multiple_files}   Set Variable    C:/Users/LaraibKhalid/Downloads/Login_Data.xlsx\nC:/Users/LaraibKhalid/Downloads/monthly-budget-expenses-spreadsheet-within-business-income-and-expense-spreadsheet-with-template-sheet-to.jpg
    Choose File    id=multipleFilesInput    ${multiple_files}
    Click Button    xpath=//form[@id="multipleFilesForm"]/child::button[@type="submit"]

Test Case 15: Static Web Table
    Scroll Element Into View    //table[@name='BookTable']
    ${rows}=    Get WebElements   xpath=//table[@name='BookTable']/tbody/tr
    FOR    ${table_row}    IN    @{rows}
        Log To Console   Table rows is: ${table_row.text}
    END

    ${columns}=    Get WebElements    xpath=//table[@name='BookTable']/tbody/tr[2]/td
    FOR    ${table_col}    IN    @{columns}
        Log To Console    2nd Row is: ${table_col.text}
    END

    ${third_col}=    Get WebElements    xpath=//table[@name='BookTable']/tbody/tr/td[3]
    FOR    ${table_third_col}    IN    @{third_col}
        Log To Console   3rd Column is:${table_third_col.text}

    END
    
Test Case 16: Dynamic Web Table
    Scroll Element Into View    xpath=//table[@id="taskTable"]
    ${rows}=    Get WebElements    xpath=//table[@id="taskTable"]/tbody/tr
    FOR    ${table_row}    IN    @{rows}
        ${row_text}=    Get Text    ${table_row}
        Log To Console    Dynamic Table Row: ${row_text}
    END

    ${columns}=    Get WebElements    xpath=//table[@id="taskTable"]/tbody/tr[2]/td
    FOR    ${table_col}    IN    @{columns}
        ${col_text}=    Get Text    ${table_col}
        Log To Console   Dynamic Table 2nd Row is: ${col_text}
    END

    ${third_col}=    Get WebElements    xpath=//table[@id="taskTable"]/tbody/tr/td[3]
    FOR    ${table_third_col}    IN    @{third_col}
        ${third_col_text}=    Get Text    ${table_third_col}
        Log To Console    Dynamic Table 3rd Column is:${third_col_text}
    END

Test Case 17: Pagination Web Table
    Scroll Element Into View    xpath=//table[@id="productTable"]
    ${rows}=    Get WebElements    xpath=//table[@id="productTable"]/tbody/tr
    FOR    ${table_row}    IN    @{rows}
        ${row_text}=    Get Text    ${table_row}
        Log To Console    Pagination Table Row: ${row_text}
    END
    Click Element    xpath=//ul[@id='pagination']//child::a[text()='4']
        ${rows}=    Get WebElements    xpath=//table[@id="productTable"]/tbody/tr
    FOR    ${table_row}    IN    @{rows}
        ${row_text}=    Get Text    ${table_row}
        Log To Console    Pagination Table of 4th Page Row: ${row_text}
    END
    Select Checkbox    xpath=//table[@id="productTable"]/tbody/tr[1]/td[4]/input
    Select Checkbox    xpath=//table[@id="productTable"]/tbody/tr[4]/td[4]/input

Test Case 18: Form Filling
    Input Text    xpath=//input[@name="input1"]    Laraib Khalid Section 1
    Click Button    xpath=//button[@id="btn1"]
    Input Text     xpath=//input[@name="input2"]    Laraib Khalid Section 2
    Click Button    xpath=//button[@id="btn2"]
    Input Text     xpath=//input[@name="input3"]    Laraib Khalid Section 3
    Click Button    xpath=//button[@id="btn3"]
    
Test Case 19: Search
    Input Text    id=Wikipedia1_wikipedia-search-input    Ds
    Click Element    xpath=//input[@class="wikipedia-search-button"]
    Sleep    3s
    Wait Until Element Is Visible    xpath=//div[@class="wikipedia-search-results"]     10s
    Click Element   xpath=(//div[@id="wikipedia-search-result-link"]//a)[1]

Test Case 20: Go Back to First Page
    Switch Window    Automation Testing Practice

Test Case 21: Go to New Website
    Go To    https://petstore.octoperf.com/actions/Account.action?newAccountForm=
    Sleep    5s

Test Case 22: Go Back to Old Website
    Go Back
    
Test Case 23: Press Dynamic Button
    ${button_text}=    Get Text    xpath=//h2[text()='Dynamic Button']/following::button
    IF    '${button_text}' == 'START'
        Click Button    xpath=//h2[text()='Dynamic Button']/following::button
        ${after_press_button_text}=    Get Text    xpath=//h2[text()='Dynamic Button']/following::button
        Log To Console    ${after_press_button_text}
        Should Match    STOP    ${after_press_button_text}
    ELSE
        Click Button    xpath=//h2[text()='Dynamic Button']/following::button
        ${after_press_button_text}=    Get Text    xpath=//h2[text()='Dynamic Button']/following::button
        Log To Console    ${after_press_button_text}
        Should Match    START    ${after_press_button_text}
    END


    ${stop_button_text}=    Get Text    xpath=//h2[text()='Dynamic Button']/following::button
    IF    '${stop_button_text}' == 'START'
        Click Button    xpath=//h2[text()='Dynamic Button']/following::button
        ${after_press_button_text}=    Get Text    xpath=//h2[text()='Dynamic Button']/following::button
        Log To Console    ${after_press_button_text}
        Should Match    STOP    ${after_press_button_text}
    ELSE
        Click Button    xpath=//h2[text()='Dynamic Button']/following::button
        ${after_press_button_text}=    Get Text    xpath=//h2[text()='Dynamic Button']/following::button
        Log To Console    ${after_press_button_text}
        Should Match    START    ${after_press_button_text}
    END


Test Case 24: Handle Simple Alert
    Click Button    xpath=//button[text()='Simple Alert']
    Handle Alert    Accept

Test Case 25: Handle Confirmation Alert
    Click Button    xpath=//button[text()='Confirmation Alert']
    Handle Alert    Dismiss
    ${text}=    Get Text    id=demo
    Should Be Equal    ${text}    You pressed Cancel!
    Log To Console    ${text}
    
Test Case 26: Handle Prompt Alert
    ${name}=    Set Variable    Laraib Khalid

    Click Button    xpath=//button[text()='Prompt Alert']

    Input Text Into Alert    ${name}
    Handle Alert    accept

    Element Text Should Be    id=demo    Hello ${name}! How are you today?
#    26 Nov 1990
    Sleep    20s