//
//  TestSampleTests.swift
//  TestSampleTests
//
//  Created by Teacher on 27.04.2021.
//

import XCTest
@testable import TestSample

class TestCartService: XCTestCase {
    override func setUpWithError() throws {
            cartService = CartService()
    }

    private var cartService: CartService!

    func testAddingToCart() {
        let product = Product(id: "1", name: "iPhone", price: 1000)
        cartService.store(product: product, quantity: 10)

        let expectedResult = Array(repeating: product, count: 10)
        XCTAssertEqual(expectedResult, cartService.cart)
    }

    func testCartClear() {
        let product = Product(id: "1", name: "iPhone", price: 1000)
        cartService.store(product: product, quantity: 10)

        cartService.clear()

        XCTAssertEqual(cartService.cart, [])
    }

    func testCartRemovedProducts() {
        let product = Product(id: "1", name: "iPhone", price: 1000)
        cartService.store(product: product, quantity: 10)

        let expectedResult = Array(repeating: product, count: 10)
        let result = cartService.clear()

        XCTAssertEqual(expectedResult, result)
    }
}
