*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Keywords ***
key selected
    [Arguments]     ${keySelected}
    Click Element    css:div:nth-of-type(${keySelected}) > .grid.search-product

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
    [Arguments]     ${stockMessage}
    Element Text Should Be    css:.cell.shrink.stock-availability-status    ${stockMessage}
