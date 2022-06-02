*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library    String
Library    Collections

*** Variables ***
${url}  https://www.takealot.com/

*** Keywords ***
key selected
    [Arguments]     ${keySelected}
    Click Element    css:div:nth-of-type(${keySelected}) > .grid.search-product

search for
    [Arguments]     ${searchText}
    Clear Element Text    name:search
    Input Text    name:search    ${searchText}
    Click Button    class:search-btn
