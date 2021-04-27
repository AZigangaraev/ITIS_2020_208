//
//  ViewController.swift
//  TestSample
//
//  Created by Teacher on 27.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var cartView: UIView!
    @IBOutlet private var cartDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
        updateCartView()
    }

    let cartService: CartService = CartService()
    let products: [Product] = [
        Product(id: "1", name: "iPhone", price: 1000),
        Product(id: "2", name: "iMac", price: 1300),
        Product(id: "3", name: "iPad", price: 799)
    ]

    @IBAction private func clearCart() {
        cartService.clear()
        updateCartView()
    }

    private func updateCartView() {
        cartView.isHidden = cartService.cart.isEmpty
        cartDescriptionLabel.text = "You have \(cartService.cart.count) items in cart"
    }

    // MARK: - Table view

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProductCell else { fatalError() }

        let product = products[indexPath.row]
        cell.nameLabel.text = product.name
        cell.priceLabel.text = String(describing: product.price)
        cell.addToCart = { [weak self] in
            self?.cartService.store(product: product, quantity: 1)
            self?.updateCartView()
        }
        return cell
    }
}

