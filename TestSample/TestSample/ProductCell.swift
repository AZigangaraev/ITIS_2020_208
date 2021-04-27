//
//  ProductCell.swift
//  TestSample
//
//  Created by Teacher on 27.04.2021.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    var addToCart: (() -> Void)?

    @IBAction private func addTap() {
        addToCart?()
    }
}
