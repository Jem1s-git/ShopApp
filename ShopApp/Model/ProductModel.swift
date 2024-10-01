//
//  ProductModel.swift
//  ShopApp
//
//  Created by Кирилл Уваров on 24.09.2024.
//


import SwiftUI

// Product Model
struct Product: Identifiable {
    
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products
var productsList = [
    Product(name: "ebi", category: "sushi", image: "ebi", color: .pink, price: 8),
    Product(name: "san", category: "sushi", image: "sushi 1", color: .yellow, price: 18),
    Product(name: "maki", category: "sushi", image: "maki-2", color: .brown, price: 24),
    Product(name: "nigiri", category: "sushi", image: "nigiri", color: .red, price: 29),
    Product(name: "tamago", category: "sushi", image: "tamago", color: .orange, price: 17),
    Product(name: "nan", category: "sushi", image: "nigiri-2", color: .purple, price: 13),
]
    
