*** Settings ***
Library     SeleniumLibrary
Suite Setup     Open Test Browser
Suite Teardown     Close Browser

*** Keywords ***
Open Test Browser
    Open Browser    https://designer.mocky.io/      Chrome
    Maximize Browser Window

*** Test Cases ***
Get Title
    ${title}=   Get Title
    Log To Console    ${title}
    Title Should Be    Mocky: The world's easiest & fastest tool to mock your APIs
    Should Match    ${title}    Mocky: The world's easiest & fastest tool to mock your APIs


Get Page Source
    ${page_source}=     Get Source
    Log     Page source is: ${page_source}
    Page Should Contain    Mocky
    
    
Get URL
    ${url}=     Get Location
    Log To Console    URL is: ${url}
    Location Should Be    ${url}
    Location Should Contain    mocky


User Information
    Go To    https://petstore.octoperf.com/actions/Account.action?newAccountForm=
    Title Should Be    JPetStore Demo
    Page Should Contain    Account Information
    Location Should Contain    petstore
    Wait Until Element Is Visible    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[1]
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[1]     004
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[2]      Bss@2233
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[3]    Bss@2233
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[4]    amyma
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[5]    usman
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[6]    amymarajpoot1@gmail.com
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[7]    066490445688
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[8]    23 A main road, lhg
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[9]    23 A main road, lhg
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[10]    Lahore
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[11]    punjab
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[12]    23456
    Input Text    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[13]    Pakistan
    Select From List By Label    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[14]  english
    Select From List By Label    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[15]   DOGS
    Select Checkbox    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[16]
    Sleep    10s
    Checkbox Should Be Selected    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[16]
    Select Checkbox    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[17]
    Checkbox Should Be Selected     xpath=(//div[@id="Content"]//following::*[self::input or self::select])[17]
    Element Should Be Enabled    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[18]
    Click Button    xpath=(//div[@id="Content"]//following::*[self::input or self::select])[18]
    
    Go Back
    Sleep    10s