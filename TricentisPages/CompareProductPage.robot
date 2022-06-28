*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections
Library    XML

*** Keywords ***

clearCompareList
    ${doClear}      Get Element Count    css:.clear-list
    
    IF    ${doClear} > 0
         Click Element    css:.clear-list
    END

getProductPrice
    [Arguments]     ${productNum}

    ${productNum}   Evaluate    int(${productNum})+int("1")

    IF    ${productNum} == 2
        ${productPrice}     Get Text    css:.product-price > td:nth-of-type(2)
    ELSE
        ${productPrice}     Get Text    css:.product-price > td:nth-of-type(3)
    END


    Return From Keyword     ${productPrice}