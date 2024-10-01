//
//  Home.swift
//  ShopApp
//
//  Created by Кирилл Уваров on 23.09.2024.
//


import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            VStack {
                // Заголовок
                HStack {
                    Text("Оформление заказа")
                        .font(.system(size: 36))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 70, height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                }
            }
            .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
