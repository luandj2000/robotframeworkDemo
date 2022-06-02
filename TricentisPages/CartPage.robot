*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Keywords ***

verifyAddedItem
    [Arguments]     ${item}
    ${cartItem}    Get Text    css:.product-name
    ${itemCorrect}=     Convert To Boolean    "False"
    IF    "${cartItem}" == "${item}"
        ${itemCorrect}=     Convert To Boolean    "True"
    ELSE
         ${itemCorrect}=        Convert To Boolean    "False"
    END
    RETURN      ${itemCorrect}
        