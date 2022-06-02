*** Settings ***
Documentation       This is our first Robot Framework Test
# Library section
Library             SeleniumLibrary
Library             ../customLibraries/chromedriversync.py
Library    String
Library    Collections

Resource    ../frameworkClasses/globalSetup.robot
Resource    ../TricentisPages/HomePage.robot
Resource    ../TricentisPages/ElectronicsPage.robot
Resource    ../TricentisPages/ManageItemPage.robot
Resource    ../TricentisPages/CartPage.robot
Resource    ../TricentisPages/ComputersPage.robot

# Suite setup and tear down
Suite Setup           test setup    ${url}
Suite Teardown       Close Browser


*** Variables ***
${url}  http://demowebshop.tricentis.com/
${menuBarOption}
${electOption}
${cellPhoneItem}
${verifyCartItem}
${TestPass}     ${True}
${categoryOption}
${computerOption}
${desktopItem}

*** Test Cases ***

GIVEN_ShopperOnHomePage_WHEN_TopMenuBarUsed_AND_Electronics_OptionCellPhones_ItemSmartPhoneSelected_AND_ItemAddedToCart_THEN_SmartPhoneDisplaysOnCartPage

    ${menuBarOption}    Set Variable    ELECTRONICS
    ${electOption}      Set Variable    Cell phones
    ${cellPhoneItem}    Set Variable    Smartphone

    searchByTopMenuBarItem          ${menuBarOption}
    selectElectronicDisplayOption   ${electOption}
    selectCellPhoneDisplayItem      ${cellPhoneItem}
    addToCart
    removeCartNotification
    goToCart
    ${verifyCartItem}       verifyAddedItem     ${cellPhoneItem}
    Should Be Equal    ${verifyCartItem}        ${TestPass}

GIVEN_ShopperOnHomePage_WHEN_CategoriesNavigationUsed_AND_Computers_OptionDesktops_ItemSimpleComputerSelected_AND_ItemAddedToCart_THEN_SimpleComputerDisplaysOnCartPage
    ${categoryOption}    Set Variable        Computers
    ${computerOption}   Set Variable        Desktops
    ${desktopItem}      Set Variable        Simple Computer

    searchByCategoryMenu    ${categoryOption}
    selectComputerOptionByCategoryMenu      ${categoryOption}
    selectDesktopDisplayItem    ${desktopItem}
    selectSimpleComputerProcessor
    addToCart
    removeCartNotification
    goToCart
    ${verifyCartItem}       verifyAddedItem        ${desktopItem}
    Should Be Equal    ${verifyCartItem}        ${TestPass}