*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Keywords ***

selectComputerOptionByCategoryMenu
    [Arguments]     ${computerOption}
    
    IF    "${computerOption}" == "Desktops"
        Click Element    css:.block-category-navigation [href='\\/desktops']
    ELSE
         IF    "${computerOption}" == "NoteBooks"
             Click Element    css:.block-category-navigation [href='\\/notebooks']
         ELSE
              IF    "${computerOption}" == "Accessories"
                   Click Element    css:.block-category-navigation [href='\\/accessories']
              END
         END
    END

selectDesktopDisplayItem
    [Arguments]     ${desktop}
    Click Element    link:${desktop}
