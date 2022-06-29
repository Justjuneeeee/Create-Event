*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary
Variables       ${CURDIR}/../Variables/common.yaml


*** Keywords ***
SETUP Script
    Open Browser    ${COMMON.URL}    ${COMMON.BROWSER}    option=ignore-certificate-errors
    Maximize Browser Window
    Set Selenium Speed    0.5

LOGIN account Success
    Input Text    ${REGISTER.EMAIL}    june_justjunee@hotmail.com
    Input Text    ${REGISTER.PASSWORD}    123456
    Click Button    ${LOGIN.LOGIN}

GUild Munu
    Click Button    ${EDIT_PF.Menu_Profile}
    Click Element    ${EDIT_PF.Tap_Profile}

Validate field
    Click Button    ${EDIT_PF.Update_BT}
    Scroll Element Into View    //input[@name="nickName"]
    Element Text Should Be
    ...    //input[@name="nickName"]/..//div[@class="invalid-feedback text-left"]
    ...    Please enter your nickname
    Element Text Should Be
    ...    //select[@id="department"]/../div[@class="invalid-feedback text-left"]
    ...    Please select your department
    Element Text Should Be
    ...    //select[@id="position"]/../div[@class="invalid-feedback text-left"]
    ...    Please select your position
    Element Text Should Be
    ...    //input[@id="tel"]/../div[@class="invalid-feedback text-left"]
    ...    Please enter your telephone number
    Element Text Should Be
    ...    //input[@name="birthDate"]/../../div[@class="invalid-feedback text-left"]
    ...    Please select your birth date
    Element Text Should Be
    ...    //input[@name="startDate"]/../../div[@class="invalid-feedback text-left"]
    ...    Please select your start date
    Element Text Should Be
    ...    //input[@name="address"]/../div[@class="invalid-feedback text-left"]    Please enter your address
    Element Text Should Be
    ...    //select[@name="province"]//parent::div//parent::div//parent::div//div[@class="invalid-feedback text-left"]
    ...    Please enter your province
    Element Text Should Be
    ...    //select[@name="district"]//parent::div//parent::div//parent::div//div[@class="invalid-feedback text-left"]
    ...    Please enter your district
    Element Text Should Be
    ...    //select[@name="subDistrict"]//parent::div//parent::div//parent::div//div[@class="invalid-feedback text-left"]
    ...    Please enter your sub district
    Element Text Should Be
    ...    //input[@name="postalCode"]/../div[@class="invalid-feedback text-left"]    Please enter your postal code

Check Validate popup
#EDUCATIONAL INFORMATION

    Click Button    ${EDIT_PF.Education_bt}
    Click Button    ${EDIT_PF.Submit}
    #Element Text Should Be
    #...    //input[@class="p-inputtext p-component p-autocomplete-input"]/../../../div[@class="invalid-feedback"]
    #...    Please enter your university
    Element Text Should Be    //input[@id="degree"]/../div[@class="invalid-feedback"]    Please enter your degree
    Element Text Should Be    //input[@id="gpa"]/../div[@class="invalid-feedback"]    Please enter your gpa
    Element Text Should Be    //select[@id="year"]/../div[@class="invalid-feedback"]    Please enter your year
    Click Button    ${EDIT_PF.Close}

#EXPERIENCE INFORMATION
    Click Button    ${EDIT_PF.Experience_bt}
    Click Button    ${EDIT_PF.Submit}
    Element Text Should Be
    ...    //input[@id="description"]/../div[@class="invalid-feedback"]
    ...    Please enter your description
    Element Text Should Be    //select[@id="startYear"]/../div[@class="invalid-feedback"]    Please enter your year
    Element Text Should Be    //select[@id="endYear"]/../div[@class="invalid-feedback"]    Please enter your year
    Click Button    ${EDIT_PF.Close}

#SKILL INFORMATION
    Click Button    ${EDIT_PF.Skill_bt}
    Click Button    ${EDIT_PF.Submit}
    Element Text Should Be
    ...    //select[@id="skillLevel"]/../div[@class="invalid-feedback"]
    ...    Please enter your skill level
    Click Button    ${EDIT_PF.Close}

#INTERESTS INFORMATION
    Click Button    ${EDIT_PF.Interest_bt}
    Click Button    ${EDIT_PF.Close}

#GUILD INFORMATION
    Click Button    ${EDIT_PF.Guild_bt}
    Click Button    ${EDIT_PF.Submit}
    Element Text Should Be    //select[@id="guildName"]/../div[@class="invalid-feedback"]
    ...    Please enter your guild
    Click Button    ${EDIT_PF.Close}
