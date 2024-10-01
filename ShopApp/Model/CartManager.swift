//
//  CartManager.swift
//  ShopApp
//
//  Created by Кирилл Уваров on 30.09.2024.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var totalPrice: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        totalPrice += product.price
        
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id}
        totalPrice -= product.price
    }
}
