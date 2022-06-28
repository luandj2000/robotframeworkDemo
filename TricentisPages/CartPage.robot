*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Variables ***
${quantity}
${quantityDirty}
${groundCost}
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

clearCart
    Click Element    css:input[name='removefromcart'
    updateCart

updateCart
    Click Element    css:input[name='updatecart']

# changes the quantity of an item in the cart.
# note: only supports 1 item.
changeSingleItemQuantity
    [Arguments]     ${amount}
    Clear Element Text      css:.qty-input
    Input Text     css:.qty-input    ${amount}
    updateCart

getSingleItemQuantity
    ${quantityDirty}       Get Value        css:.qty-input
    ${quantityDirty}        Replace String Using Regexp    ${quantityDirty}    \\D    ${EMPTY}

    TRY
         ${quantity}        Convert To Integer    ${quantityDirty}
    EXCEPT
         Log    Failed to convert quantityDirty string to int.
        ${quantity}       Convert To Integer      -1
    END
    Return From Keyword     ${quantity}

enterShippingDetails
    [Arguments]     ${country}      ${province}     ${postalCode}
    Select From List By Label       css:select#CountryId        ${country}
    Select From List By Label       css:select#StateProvinceId  ${province}
    Input Text      css:input#ZipPostalCode     ${postalCode}
    Click Element    css:input[name='estimateshipping']

getGroundShippingCost
    ${groundCost}       Get Text    css:li:nth-of-type(1) > .option-name
    Return From Keyword     ${groundCost}