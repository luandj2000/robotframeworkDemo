*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Keywords ***

addToCart
    Click Element    css:.add-to-cart-button.button-1
    
removeCartNotification
    Click Element    css:div#bar-notification > span[title='Close']
    Wait Until Keyword Succeeds    10    2    Element Should Not Be Visible    css:div#bar-notification > span[title='Close']


selectSimpleComputerProcessor
    Click Element    id:product_attribute_75_5_31_96

addToCompareList
    Click Element    css:input[value='Add to compare list']