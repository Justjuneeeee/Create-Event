*** Settings ***
Library    DataDriver    TestData/profile.xlsx   sheet_name=Sheet1
Resource    ${CURDIR}/Keywords/keywords.robot
Suite Setup    SETUP Script profile
Test Template    Edit Profile page Successs2
# Suite Teardown    Close Browser

*** Test Cases ***
TC1 - Edit data on Edit Profile page 

*** Keywords ***
Edit Profile page Successs2
    [Arguments]     ${Nick_Name}
    ...     ${First_Name}
    ...     ${Last_Name}
    ...     ${Department}
    ...     ${Position}
    ...     ${Nationality}
    ...     ${Telephone}
    ...     ${Address}

    Click Button   ${COMMON.PROFILE_NAME}
    Click Element   ${COMMON.ICON_MENU_PROFILE}
    Input Text      ${EDIT_PROFILE.nickName}    ${Nick_Name}
    Input Text      ${EDIT_PROFILE.firstName}    ${First_Name}
    Input Text      ${EDIT_PROFILE.lastName}    ${Last_Name}
    Select From List By Label      ${EDIT_PROFILE.department}     ${Department}
    Select From List By Label      ${EDIT_PROFILE.position}    ${Position}
    Input Text      ${EDIT_PROFILE.nationality}    ${Nationality}
    Input Text      ${EDIT_PROFILE.telephone}    ${Telephone}
    Input Text      ${EDIT_PROFILE.address}    ${Address}
