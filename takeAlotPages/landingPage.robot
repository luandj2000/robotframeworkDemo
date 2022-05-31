*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library    String
Library    Collections
Suite Setup         test setup
Suite Teardown      Close Browser
*** Variables ***
${url}  https://www.takealot.com/
*** Test Cases ***
First test case
    search for    Ladies Long Sleeve Nottingham Shirt
    click item    2
    Select from the dropdown list   Grey
    click size    M
    check title     Grey    M
    check stock      Ships in 4-6 work days
    #small prac
    #use the keyword docs (built in and selenium)
    #find a keyword to enter some search text into the takealot search input box
    #small prac 2:
    #create a key that takes in which grid item to click on
    #and then used that keyword to click on the item

   # Input Text    class:search-field     Desktop
   # Click Button    class:search-btn
   # key selected    3


Second test case
  search for    shirt
  click item    4
  click size    S
  check size    S
  click add to cart

Third test case
    search for    shirt
    click item    4
    click size    M
   # click add to cart
Forth test case
    search for    shirt
    click item    4
    click size    L
    #click add to cart
Five test case
    search for    shirt
    click item    4
    click size    XL
    #click add to cart

    ### add a new keyword into this robot file to click on the add to chart button
    ## using your own locator strategy
*** Keywords ***
key selected
    [Arguments]     ${keySelected}
    Click Element    css:div:nth-of-type(${keySelected}) > .grid.search-product

search for
    [Arguments]     ${searchText}
    Clear Element Text    name:search
    Input Text    name:search    ${searchText}
    Click Button    class:search-btn
click item
    [Arguments]     ${itemIndex}
    Click Element   css:div:nth-of-type(${itemIndex}) > .grid.search-product .button.dark-green.ghost.shop-all-options
click size
    [Arguments]     ${itemSize}
    Click Button    ${itemSize}
click add to cart
    Click Button    xpath://body/div[@id='shopfront-app']/div[4]/div[1]/div[2]/aside[1]/div[1]/div[2]/div[1]/div[1]/div[2]/a[1]

Select from the dropdown list
    [Arguments]     ${dropDownOption}
    Click Element    css:div[role='listbox']
    #Click Element    css:li:nth-of-type(1) > .select-dropdown-module_list-item_2kHtk
    Click Element    link:${dropDownOption}

check size
    [Arguments]     ${itemSize}
    Element Text Should Be    css:.variant-selector-module_selector-selected_18T_4    ${itemSize}

check title
    [Arguments]     ${itemColour}   ${itemSize}
    Wait Until Element Contains    css:.pdp-main-panel h1    ${itemColour}
    ${getTitle}=    Get Text    css:.pdp-main-panel h1
    Log To Console    ${getTitle}
    ${result}=      Split String    ${getTitle}     -
    Log To Console    ${getTitle}
    ${actualTitleColour}=   Get From List   ${result}     1
    ${actualTitleSize}=     Get From List    ${result}    2

    #Assertions
    Should Be Equal    ${actualTitleColour.strip()}  ${itemColour}
    Should Be Equal    ${actualTitleSize.strip()}    ${itemSize}

check stock
    [Arguments]     ${stockMessgae}
    Element Text Should Be    css:.cell.shrink.stock-availability-status    ${stockMessage}
