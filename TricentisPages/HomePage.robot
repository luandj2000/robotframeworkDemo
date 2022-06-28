*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Variables ***
${cartAmount}
${cartAmountDirty}
*** Keywords ***

goToHomePage
    [Arguments]     ${url}
    Go To    ${url}

searchByTopMenuBarItem
    [Arguments]     ${item}
    Click Element    link:${item}

goToCart
    Click Element    css:li#topcartlink > .ico-cart

searchByCategoryMenu
    [Arguments]     ${category}

    IF    "${category}" == "Books"
        Click Element    css:.block-category-navigation [href='\\/books']
    ELSE
        IF    "${category}" == "Computers"
          Click Element    css:.block-category-navigation [href='\\/computers']
        ELSE
            IF    "${category}" == "Electronics"
                Click Element    css:.block-category-navigation [href='\\/electronics']
            ELSE
                 IF    "${category}" == "Apparel $ Shoes"
                     Click Element    css:.block-category-navigation [href='\\/apparel-shoes']
                 ELSE
                      IF    "${category}" == "Digital downloads"
                          Click Element    css:.block-category-navigation [href='\\/digital-downloads']
                      ELSE
                           IF    "${category}" == "Jewelry"
                               Click Element    css:.block-category-navigation [href='\\/jewelry']
                           ELSE
                                IF    "${category}" == "Gift Cards"
                                    Click Element    css:.block-category-navigation [href='\\/gift-cards']
                                END
                           END
                      END
                 END
            END
        END
         
    END

searchBar
    [Arguments]     ${item}
    Input Text    css:input#small-searchterms    ${item}
    Click Element    css:form[method='get'] > .button-1.search-box-button

cartItemAmount
    ${cartAmountDirty}      Get Text    css:.cart-qty
    ${cartAmountDirty}      Replace String Using Regexp    ${cartAmountDirty}    \\D    ${EMPTY}
    TRY
        ${cartAmount}       Convert To Integer      ${cartAmountDirty}
    EXCEPT
        Log    Failed to convert cartAmountDirty string to int.
        ${cartAmount}       Convert To Integer      -1
    END
    Return From Keyword     ${cartAmount}