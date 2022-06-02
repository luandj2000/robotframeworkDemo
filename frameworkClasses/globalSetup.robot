*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library    String
Library    Collections



*** Keywords ***
test setup
    [Arguments]     ${url}
    ${chromedriver_path}=   Get Chromedriver Path
    Create Webdriver    Chrome  executable_path=${chromedriver_path}
    Go To      ${url}
    Maximize Browser Window
    Set Browser Implicit Wait    10
    #Wait Until Keyword Succeeds    3    10    Click Button    class:cookies-banner-module_dismiss-button_24Z98
    Capture Page Screenshot     EMBED

    #css:dic:nth-of-type(1) > .button.has-tooltip.image-fallback.size.variant-selector-module_button-selector_1-w98
