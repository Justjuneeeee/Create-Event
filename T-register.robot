*** Settings ***
# Library     AllureReportLibrary   ${CURDIR}/Report
Resource    ${CURDIR}/Keywords/keywords.robot
Suite Setup    SETUP Script
# Suite Teardown    Close Browser

*** Test Cases ***
TC1 - Check validate not input value on REGISTER PAGE
    Validate not input on REGISTER PAGE
    # Write Excel

TC2 - Create new account
    Register new account
