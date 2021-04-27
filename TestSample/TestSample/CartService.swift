//
//  CartService.swift
//  TestSample
//
//  Created by Teacher on 27.04.2021.
//

import Foundation

struct Product: Equatable {
    let id: String
    let name: String
    let price: Decimal
}

class CartService {
    private(set) var cart: [Product] = []

    func store(product: Product, quantity: Int) {
        for _ in 0..<quantity {
            cart.append(product)
        }
    }

    @discardableResult
    func clear() -> [Product] {
        defer { cart = [] }

        return cart
    }
}
