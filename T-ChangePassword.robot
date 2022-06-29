*** Settings ***
# Library    AllureReportLibrary    ${CURDIR}/Report
Resource        ${CURDIR}/Keywords/chgpass.robot

#Resource    ${CURDIR}/Keywords/keywords.robot
Suite Setup     SETUP Script
# Suite Teardown    Close Browser


*** Test Cases ***
#TC1 - Check validate not input value on REGISTER PAGE
#Validate not input on REGISTER PAGE
# Write Excel

#TC2 - Create new account
#Register new account

TC3 - Change Password
    LOGIN account Success
    Change Password
    #Validate not input on Change Password page
    #Validate case fail
    #Duplicate password
    #Validate case fail2
    #Validate case password not match
    Change Password Success
