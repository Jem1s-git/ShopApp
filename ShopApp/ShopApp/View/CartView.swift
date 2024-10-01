//
//  CartView.swift
//  ShopApp
//
//  Created by Кирилл Уваров on 26.09.2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    HStack {
                        Text("Cart")
                            .font(.system(size: 36))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(cartManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 50, height: 50)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundStyle(.black)
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 50, height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundStyle(.black)
                    
                    }
                    .padding(30)
                  
                    
                    // Cart Products
                    VStack(spacing: 20) {
                        ForEach(cartManager.products, id: \.name) { item in
                            CartProductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                  // Card Total
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Delivery Amout")
                            Spacer()
                            Text("$0.00")
                                .font(.system(size: 24,weight:  .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Amout")
                            .font(.system(size: 24))
                               
                        Text("USD \(cartManager.totalPrice)")
                            .font(.system(size: 36,weight:  .semibold))
                                  
                    }
                    .padding(30)
                    .frame(maxWidth:.infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
                    // Buttons
                    Button {
                        
                    } label: {
                        Text("Make Payment")
                            .frame(maxWidth:.infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
            }
            
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

//MARK: Cart Product View
struct CartProductCard: View {
    
    var product: Product
    
    var body: some View {
        HStack (alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80,height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}
            
                
    
