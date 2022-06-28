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
Test Teardown       testCleanup


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
${cartItems}
${quantityExpected}     2
${quantityActual}
${cartItemAmountActual}
${country}
${province}
${postalCode}
${groundShippingCost}
*** Test Cases ***

# user story 1: search using the top menu bar
GIVEN_ShopperOnHomePage_WHEN_TopMenuBarUsed_AND_Electronics_OptionCellPhones_ItemSmartPhoneSelected_AND_ItemAddedToCart_THEN_SmartPhoneDisplaysOnCartPage

    ${menuBarOption}    Set Variable    ELECTRONICS
    ${electOption}      Set Variable    Cell phones
    ${cellPhoneItem}    Set Variable    Smartphone

    goToHomePage        ${url}
    searchByTopMenuBarItem          ${menuBarOption}
    selectElectronicDisplayOption   ${electOption}
    selectCellPhoneDisplayItem      ${cellPhoneItem}
    addToCart
    removeCartNotification
    goToCart

    ${verifyCartItem}       verifyAddedItem     ${cellPhoneItem}
    Should Be Equal    ${verifyCartItem}        ${TestPass}

# user story 2: browse using the categories list.
GIVEN_ShopperOnHomePage_WHEN_CategoriesNavigationUsed_AND_Computers_OptionDesktops_ItemSimpleComputerSelected_AND_ItemAddedToCart_THEN_SimpleComputerDisplaysOnCartPage
    ${categoryOption}    Set Variable        Computers
    ${computerOption}   Set Variable        Desktops
    ${desktopItem}      Set Variable        Simple Computer

    goToHomePage        ${url}
    searchByCategoryMenu    ${categoryOption}
    selectComputerOptionByCategoryMenu      ${computerOption}
    selectDesktopDisplayItem    ${desktopItem}
    selectSimpleComputerProcessor
    addToCart
    removeCartNotification
    goToCart

    ${verifyCartItem}       verifyAddedItem        ${desktopItem}
    Should Be Equal    ${verifyCartItem}        ${TestPass}

# user story 3: go to cart and update quantity.
GIVEN_ShopperOnCartPage_AND_OneItemAdded_WHEN_ItemQuantityChangeToTwo_THEN_ItemQuantityDisplaysAsTwo
    ${menuBarOption}        Set Variable        ELECTRONICS
    ${electOption}          Set Variable        Cell phones
    ${cellPhoneItem}        Set Variable        Phone Cover

    goToHomePage        ${url}
    searchByTopMenuBarItem    ${menuBarOption}
    selectElectronicDisplayOption    ${electOption}
    selectCellPhoneDisplayItem    ${cellPhoneItem}
    addToCart
    removeCartNotification
    goToCart
    changeSingleItemQuantity        ${quantityExpected}

    ${quantityActual}       getSingleItemQuantity
    Should Be Equal As Integers     ${quantityExpected}      ${quantityActual}

# user story 4: remove item from cart.
GIVEN_ShopperOnCartPage_AND_OneItemAdded_WHEN_RemoveChecked_AND_UpdateShoppingCartClicked_THEN_ItemRemovedFromCart
    ${categoryOption}   Set Variable        Computers
    ${computerOption}   Set Variable        Desktops
    ${desktopItem}      Set Variable        Build your own cheap computer
    
    goToHomePage    ${url}
    searchByCategoryMenu    ${categoryOption}
    selectComputerOptionByCategoryMenu    ${computerOption}
    selectDesktopDisplayItem    ${desktopItem}
    addToCart
    removeCartNotification
    goToCart
    clearCart

    ${cartItemAmountActual}     cartItemAmount
    Should Be Equal As Integers    ${cartItemAmountActual}    0

# user story 5: estimate shipping.
GIVEN_OneItemAddedToCart_WHEN_NavigateToCart_AND_ShippingDetailsUnitedStatesAlaska99501Entered_AND_EstimateShippingButtonClicked_THEN_GroundEstimateZero
    ${menuBarOption}        Set Variable        ELECTRONICS
    ${electOption}          Set Variable        Cell phones
    ${cellPhoneItem}        Set Variable        Smartphone
    ${country}              Set Variable        United States
    ${province}             Set Variable        Alaska
    ${postalCode}           Set Variable        99501

    goToHomePage    ${url}
    searchByTopMenuBarItem    ${menuBarOption}
    selectElectronicDisplayOption    ${electOption}
    selectCellPhoneDisplayItem    ${cellPhoneItem}
    addToCart
    removeCartNotification
    goToCart
    enterShippingDetails    ${country}    ${province}    ${postalCode}

    ${groundShippingCost}       getGroundShippingCost
    Should Be Equal As Strings      ${groundShippingCost}        Ground (0.00)


*** Keywords ***

testCleanup
    ${cartItems}        cartItemAmount
    goToCart
    WHILE  ${cartItems} > 0
        clearCart
        ${cartItems}        cartItemAmount
    END

