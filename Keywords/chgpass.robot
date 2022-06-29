*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary
#Variables    ${CURDIR}/../Variables/common.yaml
Variables       ${CURDIR}/../Variables/commonprod.yaml


*** Variables ***
@{data}     EMAIL    PASSWORD    CONFIRM PASSWORD    FIRST NAME    LAST NAME    CHKagree


*** Keywords ***
SETUP Script
    Open Browser    ${COMMON.URL}    ${COMMON.BROWSER}    option=ignore-certificate-errors
    Maximize Browser Window
    Set Selenium Speed    0.5

LOGIN account Success
    Input Text    ${REGISTER.EMAIL}    thanyarat.j@entronica.co.th
    Input Text    ${REGISTER.PASSWORD}    1234567
    Click Button    ${LOGIN.LOGIN}

Change Password
    Click Button    ${CHANGE_PASSWORD.Menu_Profile}
    Click Element    ${CHANGE_PASSWORD.Profile}
    Click Element    ${CHANGE_PASSWORD.Tap}

Validate not input on Change Password page
    Click Button    ${CHANGE_PASSWORD.Save_Change}
    Element Text Should Be    //input[@id="password"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Please enter your current password
    Element Text Should Be
    ...    //input[@id="newPassword"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Please provide new password
    Element Text Should Be
    ...    //input[@id="confirmPassword"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Please enter at least 6 characters

Validate case fail
    Input Password    ${CHANGE_PASSWORD.Current_Password}    5678910
    Input Password    ${CHANGE_PASSWORD.New_Password}    123456
    Input Password    ${CHANGE_PASSWORD.Comfirm_Password}    123456
    Click Button    ${CHANGE_PASSWORD.Save_Change}
    Element Text Should Be
    ...    //div[@id='swal2-content']
    ...    invalid password
    Click Button    ${CHANGE_PASSWORD.OK_Popup}

Duplicate password
    Input Password    ${CHANGE_PASSWORD.Current_Password}    1234567
    Input Password    ${CHANGE_PASSWORD.New_Password}    1234567
    Input Password    ${CHANGE_PASSWORD.Comfirm_Password}    1234567
    Click Button    ${CHANGE_PASSWORD.Save_Change}
    Element Text Should Be
    ...    //input[@id="newPassword"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Please provide new password

Validate case fail2
    Input Password    ${CHANGE_PASSWORD.Current_Password}    1234567
    Input Password    ${CHANGE_PASSWORD.New_Password}    1234567
    Input Password    ${CHANGE_PASSWORD.Comfirm_Password}    12345678
    Click Button    ${CHANGE_PASSWORD.Save_Change}
    Element Text Should Be
    ...    //input[@id="newPassword"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Please provide new password
    Element Text Should Be
    ...    //input[@id="confirmPassword"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Your password not match

Validate case password not match
    Input Password    ${CHANGE_PASSWORD.Current_Password}    1234567
    Input Password    ${CHANGE_PASSWORD.New_Password}    12345678
    Input Password    ${CHANGE_PASSWORD.Comfirm_Password}    123456789
    Click Button    ${CHANGE_PASSWORD.Save_Change}
    Element Text Should Be
    ...    //input[@id="confirmPassword"]//parent::div//parent::div//span[@class="input-group-text"]
    ...    Your password not match
    #เปิดตา
    Click Element
    ...    //input[@name="confirmPassword"]//parent::div//parent::div//div[@class="input-group-append"]//*[1]

Change Password Success
    Input Password    ${CHANGE_PASSWORD.Current_Password}    1234567
    Input Password    ${CHANGE_PASSWORD.New_Password}    123456
    Input Password    ${CHANGE_PASSWORD.Comfirm_Password}    123456
    Click Button    ${CHANGE_PASSWORD.Save_Change}
