*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Keywords ***

goToHomePage


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