*** Settings ***
Documentation       This is our first Robot Framework Test
# Library section
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library    String
Library    Collections


Resource    ../frameworkClasses/globalSetup.robot
Resource    ../TricentisPages/HomePage.robot
Resource    ../TricentisPages/ComputersPage.robot
Resource    ../TricentisPages/ManageItemPage.robot
Resource    ../TricentisPages/ElectronicsPage.robot
Resource    ../TricentisPages/CompareProductPage.robot

Suite Setup           test setup    ${url}
Suite Teardown       Close Browser
Test Template   Compare Product List

*** Variables ***
${url}  http://demowebshop.tricentis.com/

*** Test Cases ***
GIVEN_TwoItemsSelected_WHEN_SelectedItemsAddedToCompareList_THEN_SelectedItemsWithPricesDisplayOnComparisonTable
    #${product1}                  ${price1}   ${product2}             ${price2}   ${category}
    Build your own cheap computer   800.00     Build your own computer     1200.00    Computers




*** Keywords ***

Compare Product List
    [Arguments]     ${product1}    ${price1}   ${product2}  ${price2}   ${category}
    goToHomePage    ${url}
    searchBar    ${product1}

    IF    "${category}" == "Computers"
        selectDesktopDisplayItem    ${product1}
        addToCompareList
        searchBar    ${product2}
        selectDesktopDisplayItem    ${product2}
        addToCompareList
    ELSE
        IF    "${category}" == "Electronics"
            selectCellPhoneDisplayItem     ${product1}
            addToCompareList
            searchBar    ${product2}
            selectCellPhoneDisplayItem    ${product2}
            addToCompareList
        END
    END
    ${productPrice1}        getProductPrice     2
    ${productPrice2}        getProductPrice     1

    Should Be Equal As Strings    ${productPrice1}     ${price1}
    Should Be Equal As Strings    ${productPrice2}    ${price2}