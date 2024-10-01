//
//  ContentView.swift
//  ShopApp
//
//  Created by Кирилл Уваров on 23.09.2024.
//



import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
    
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "sushi", title: "Sushi"),
    CategoryModel(icon: "miso-soup", title: "Miso-soup"),
    CategoryModel(icon: "bento", title: "Bento")
]
