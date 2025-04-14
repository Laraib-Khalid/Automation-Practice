*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
#Login
#    Open Browser    https://www.saucedemo.com/    Chrome
#    Maximize Browser Window
#    Input Text    //input[@name="user-name"]    standard_user
#    Input Password    //input[@name="password"]    secret_sauce
#    Click Element    //input[@name="login-button"]
#Handling Dropdown
#    Page Should Contain    Swag Labs
#    Sleep    3s
#    Select From List By Label    //select[@class="product_sort_container"]    Price (low to high)
#    Sleep    3s
#    Select From List By Value    //select[@class="product_sort_container"]    za
#    Sleep    3s
#    Select From List By Index    //select[@class="product_sort_container"]    3
#    Sleep    3s
#
#Handling List
#    Execute Javascript      window.open("https://only-testing-blog.blogspot.com/");
#    Switch Window       title=Only Testing
#    Select All From List    //select[@name="FromLB"]
#    Sleep    5s
#    Unselect From List By Label    //select[@name="FromLB"]      Spain
#    Click Element    //input[@value="->"]
#    Sleep    5s
#
#Handling Alerts
#    Double Click Element    //button[text()="Double-Click Me To See Alert"]
#    Handle Alert    Accept
#    Sleep    5s

Handling Frames
    Open Browser    https://letcode.in/frame    Chrome
    Maximize Browser Window
    Select Frame    //iframe[@name="firstFr"]
    Input Text    //input[@name="fname"]    Test
    Input Text    //input[@name="lname"]    Practice
    Select Frame    //div[@class="container has-text-centered mb-4 mt-6"]//iframe
    Input Text    //input[@name="email"]    testpractice@gmail.com
    Sleep    5s


Handling Nested Frames
    Go to      https://the-internet.herokuapp.com/nested_frames
    Sleep    10s
    Select Frame    //frame[@name="frame-top"]
    Select Frame    //frame[@name="frame-left"]
#    ${TEXT_DATA}    Get Text    /html/body
#    Log To Console   Link Data is: ${TEXT_DATA}
    Unselect Frame
    Select Frame    //frame[@name="frame-top"]
    Select Frame    //frame[@name="frame-middle"]
    Element Text Should Be      //div[@id="content"]    MIDDLE
#    ${TEXT_DATA}    Get Text    //div[@id="content"]
#    Log To Console   Link Data is: ${TEXT_DATA}
    Unselect Frame
    Select Frame    //frame[@name="frame-top"]
    Select Frame    //frame[@name="frame-right"]
    Unselect Frame
    Select Frame    xpath://frame[@name="frame-bottom"]
    Sleep    10s
#    Frame Should Contain    xpath://frame[@name="frame-bottom"]    Bottom

#
Handling iFrames
    Go to      https://seleniumbase.io/demo_page
    Select Frame    //iframe[@name="frameName2"]
    Element Text Should Be    //body//h4    iFrame Text

    Unselect Frame
    Select Frame    //iframe[@name="frameName3"]
    Select Checkbox    //input[@id="checkBox6"]
    Sleep    10s
