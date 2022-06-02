*** Settings ***
Documentation       This is our first Robot Framework Test
# Library section
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library    String
Library    Collections
# Resource section
Resource    ../takeAlotPages/itemsPage.robot
Resource    ../takeAlotPages/landingPage.robot
Resource    ../takeAlotPages/dailyDealsPage.robot
Resource    ../takeAlotPages/globalKeywords.robot
Resource    ../frameworkClasses/globalSetup.robot

# Suite setup and tear down
Suite Setup           test setup    ${url}
Suite Teardown       Close Browser

# Test case template
Test Template   Template Test Case
*** Variables ***
${url}  https://www.takealot.com/

*** Test Cases ***
#First test case

 #   go home
  #  Click daily deals button
    #Click radio button
  # Click check box

#Select an item from the department list
    #go home
    #Click an option in the department dropdown list

Search for Ladies Long Sleave Notthingham
    # ${searchItem}                 ${gridItem}   ${itemColour}     ${itemSize}            ${stockMessage}
     Ladies Long Sleeve Nottingham Shirt     2     Grey                 M              Ships in 4 - 6 work days
*** Keywords ***
Template Test Case
    [Arguments]     ${searchItem}   ${gridItem}     ${itemColour}     ${itemSize}       ${stockMessage}
    search for    ${searchItem}
    click item    ${gridItem}
    click size    ${itemSize}
    check size    ${itemSize}
    Select from the dropdown list    ${itemColour}
    check title    ${itemColour}    ${itemSize}
    check stock    ${stockMessage}