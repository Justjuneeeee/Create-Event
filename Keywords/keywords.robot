*** Settings ***
Library         SeleniumLibrary
Library         String
Library         openpyxl
Library         BuiltIn
Library         FakerLibrary
Variables       ${CURDIR}/../Variables/common.yaml


*** Variables ***
${excel}    write_excel_loop.xlsx
@{data}     EMAIL    PASSWORD    CONFIRM PASSWORD    FIRST NAME    LAST NAME    CHKagree


*** Keywords ***
SETUP Script
    Open Browser    ${COMMON.URL}    ${COMMON.BROWSER}    option=ignore-certificate-errors
    Maximize Browser Window
    Set Selenium Speed    0.5

Validate not input on REGISTER PAGE
    Click Element    ${LOGIN.SIGNUP}
    Click Button    ${REGISTER.CREATE_ACCOUNT}
    Element Text Should Be
    ...    //input[@id="email"]//parent::div/div[@class="invalid-feedback"]
    ...    Please enter your email
    Element Text Should Be
    ...    //input[@id="password"]//parent::div/div[@class="invalid-feedback"]
    ...    Please enter at least 6 characters
    Element Text Should Be
    ...    //input[@id="passwordRepeat"]//parent::div/div[@class="invalid-feedback"]
    ...    Please enter at least 6 characters
    Element Text Should Be
    ...    //input[@id="firstName"]//parent::div/div[@class="invalid-feedback"]
    ...    Please enter at least 5 characters
    Element Text Should Be
    ...    //input[@id="lastName"]//parent::div/div[@class="invalid-feedback"]
    ...    Please enter at least 5 characters
    Element Text Should Be
    ...    //input[@id="agreement"]//parent::div/label[@class="custom-control-label"]
    ...    I agree with the${SPACE*3}

Validate not input on LOGIN PAGE
    Press Keys    //input[@id="email"]    CTRL+A
    Press Keys    //input[@id="email"]    BACKSPACE
    Press Keys    //input[@id="password"]    CTRL+A
    Press Keys    //input[@id="password"]    BACKSPACE
    Click Button    ${LOGIN.LOGIN}
    Element Text Should Be
    ...    //input[@id="email"]//parent::div/div[@class="invalid-feedback"]
    ...    Please enter your email
    Element Text Should Be
    ...    //input[@id="password"]//parent::div/div[@class="invalid-feedback"]
    ...    Please provide your password

LOGIN account Success
    Input Text    ${REGISTER.EMAIL}    kachain2019.a@gmail.com
    Input Text    ${REGISTER.PASSWORD}    123456
    Click Button    ${LOGIN.LOGIN}

Register new account
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password    length=8    special_chars=True
    ${firstName}=    FakerLibrary.First Name
    ${lastName}=    FakerLibrary.Last Name
    Input Text    ${REGISTER.EMAIL}    ${email}
    Input Text    ${REGISTER.PASSWORD}    ${password}
    Input Text    ${REGISTER.CONFIRM_PASSWORD}    ${password}
    Input Text    ${REGISTER.FIRST_NAME}    ${firstName}
    Input Text    ${REGISTER.LAST_NAME}    ${lastName}
    Click Element    ${REGISTER.CHECKBOX_AGREE}
    # Click Button    ${REGISTER.CREATE_ACCOUNT}

# Write Excel
#    ${wb}    Load Workbook    ${CURDIR}/../${excel}
#    ${ws}    Set Variable    ${wb['Sheet1']}
#    ${max_rows}    Set Variable    ${ws.max_row}
#    ${max_columns}    Set Variable    ${ws.max_column}
#    Log To Console    row: ${max_rows-1}
#    Log To Console    column: ${max_columns}
#    Check validate on register page    ${max_rows}

# Check validate on register page
#    [Arguments]    ${max_rows}
#    FOR    ${i}    IN RANGE    ${max_rows}
#    Log To Console    ${i}
#    END
