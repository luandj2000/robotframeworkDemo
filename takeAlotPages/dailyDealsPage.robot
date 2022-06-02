*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library             String
Library             Collections


*** Keywords ***
Click daily deals button
    Click Element    css:.flyout-button

Click radio button
    Click Element    css:.filter_Availability.radio-select-group > div:nth-of-type(1)

Click check box
    Click Element   css:div > li:nth-of-type(1)
