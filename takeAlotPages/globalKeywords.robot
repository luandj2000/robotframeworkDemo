*** Settings ***
Documentation       This is our first Robot Framework Test
# Library section
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py

*** Keywords ***

go home
    Click Element    css:a > img[alt='Takealot'

Click an option in the department dropdown list
    Select From List By Label    name:department     Books