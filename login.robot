*** Settings ***
# Library     AllureReportLibrary   ${CURDIR}/Report
Resource    ${CURDIR}/Keywords/keywords.robot
Suite Setup    SETUP Script
# Suite Teardown    Close Browser

*** Test Cases ***
# TC1 - Check validate not input value on LOGIN PAGE
#     Validate not input on LOGIN PAGE

TC2 - LOGIN Success
    Validate not input on LOGIN PAGE