//
//  TestSampleUITests.swift
//  TestSampleUITests
//
//  Created by Teacher on 27.04.2021.
//

import XCTest

class TestSampleUITests: XCTestCase {

    var app: XCUIApplication!

    func clearButton() -> XCUIElement {
        app.buttons["clearCartButton"]
    }

    func addToCartButton() -> XCUIElement {
        app.tables.cells.buttons["addToCartButton"].firstMatch
    }

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testCartViewNotAppearingFromStart() {
        XCTAssertFalse(clearButton().exists)
    }

    func testCartViewExistance() throws {
        addToCartButton().tap()
        XCTAssertTrue(clearButton().exists)
        clearButton().tap()
        XCTAssertFalse(clearButton().exists)
    }

    func testCartViewExistanceWhenAddingTwoProductsAndRemovingOne() throws {
        let app = XCUIApplication()
        app.launch()

        addToCartButton().tap()
        addToCartButton().tap()
        clearButton().tap()

        XCTAssertFalse(clearButton().exists)
    }
}
