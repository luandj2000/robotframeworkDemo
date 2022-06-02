*** Settings ***
Documentation       This is our first Robot Framework Test
Library             SeleniumLibrary
Library    String
Library    Collections

*** Keywords ***

selectElectronicDisplayOption
    [Arguments]     ${electronic}
   
    IF    "${electronic}" == "Camera, photo"
         Click Element    css:.sub-category-grid .item-box:nth-of-type(1) .picture a
    ELSE
        IF    "${electronic}" == "Cell phones"
             Click Element    css:.sub-category-grid .item-box:nth-of-type(2) .picture a
        END
         
    END

selectCellPhoneDisplayItem
      [Arguments]     ${cellPhone}

    IF    "${cellPhone}" == "Smartphone"
         Click Element    css:[data-productid='43'] .picture a
    ELSE
        IF    "${cellPhone}" == "Used phone"
             Click Element    css:[data-productid='15'] .picture a
        ELSE
            IF    "${cellPhone}" == "Phone Cover"
                Click Element    css:[data-productid='80'] .picture a
        END
        END

    END