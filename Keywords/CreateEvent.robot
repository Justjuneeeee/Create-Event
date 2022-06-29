*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary
Library         pyautogui
Library         ImageHorizonLibrary
Variables       ${CURDIR}/../Variables/common.yaml
#Variables    ${CURDIR}/../Variables/commonprod.yaml


*** Variables ***
${btnSelectWordfile}    xpath=//input[@type="file"]
${imgFile}              ${CURDIR}\\etflix.jpg
${titleFileOnQueue}     xpath=//span[@title="netflix.jpg"]
${reference_image}      D:\\Enterland\\Photo\\we.jpg


*** Keywords ***
SETUP Script
    Open Browser    ${COMMON.URL}    ${COMMON.BROWSER}    option=ignore-certificate-errors
    Maximize Browser Window
    Set Selenium Speed    0.5

LOGIN account Success
    Input Text    ${REGISTER.EMAIL}    thanyarat.j@entronica.co.th
    Input Text    ${REGISTER.PASSWORD}    1234567
    Click Button    ${LOGIN.LOGIN}

Go to Menu
    Wait Until Element Is Visible    //a[@href="/event"]
    Click Link    //a[@href="/event"]

Create Event
    Click Element    ${EVENT.Open_Popup_Create}
    Input Text    ${EVENT.Event_Name}    Test Robot Create Guild
    Click Button    ${EVENT.Emoji_Name}
    Wait Until Element Is Visible    ${EVENT.Select_Emoji}
    Click Element    ${EVENT.Select_Emoji}
    Click Button    ${EVENT.Click_Color}
    Click Element    ${EVENT.Select_Color}
    #SeleniumLibrary.Click Element    //div[@class="rbc-month-view"]
    #Wait Until Page Contains Element    ${EVENT.Click_Color}
    Click Element    ${EVENT.Private}
    #Click Element    ${EVENT.Close_Color}
    Input Text    ${EVENT.Location}    Test Robot Create Guild
    #Click Element    ${EVENT.Click_upload_photo}
    #Wait Until Page Contains Element    ${btnSelectWordfile}
    #Choose File    ${btnSelectWordfile}    ${imgFile}
    #ImageHorizonLibrary.Set Reference Folder    ${reference_image}
    Click Element    ${EVENT.Click_upload_photo}
    Wait Until Page Contains Element    ${EVENT.Click_upload_photo}
    #ImageHorizonLibrary.Locate    ${reference_image}
    pyautogui.Typewrite    we.jpg
    pyautogui.Key Down    'enter'
    ImageHorizonLibrary.Press Combination    Key.enter
    Click Element    ${EVENT.Click_StartDT}
    Click Element    ${EVENT.Select_StartDT}
    Click Element    ${EVENT.Click_StartTime}
    Click Element    ${EVENT.Select_StartTime}
    Click Element    ${EVENT.Click_EndDT}
    Click Element    ${EVENT.Select_EndDT}
    Scroll Element Into View    //div[contains(text(),'Tag')]
    Input Text    ${EVENT.Description}    Test Robot Create Guild
    Click Element    ${EVENT.Click_EmojiDes}
    Wait Until Element Is Visible    ${EVENT.Click_EmojiDes}
    Click Element    ${EVENT.Select_EmojiDes}
    Click Element    ${EVENT.Click_Guild}
    Click Element    ${EVENT.Select_Guild}
    Scroll Element Into View    //div[contains(text(),'Tag')]
    Click Element    //div[contains(text(),'Tag')]
    Click Element    ${EVENT.Select_Tag}
    Click Button    ${EVENT.Add_Button}

Check Validate Create
    Click Button    ${EVENT.Add_Button}

    Element Text Should Be
    ...    //div[@class="react-emoji"]/../../small[@style="color: rgb(223, 48, 98);"]
    ...    This field is required

    Element Text Should Be
    ...    //div[@class="float-label"]/div[@class="invalid-feedback"]
    ...    This field is required

    Scroll Element Into View    //div[contains(text(),'Tag')]

    Element Text Should Be
    ...    //small[@style="display: inline-block; color: rgb(223, 48, 98);"]
    ...    This field is required
