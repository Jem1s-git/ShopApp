//
//  Home.swift
//  ShopApp
//
//  Created by Кирилл Уваров on 23.09.2024.
//


import SwiftUI

struct Home: View {
    
    //MARK: Category View Propetries
    @State var selectedCategory = "Sushi"
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    HStack {
                        Text("**私を食べて🍥**")
                            .font(.system(size: 36))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 50, height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    // Collection View
                    HStack {
                        Text("Sushi **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(productsList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    //MARK: Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                ForEach(categoryList, id: \.id) { item in
                    Button {
                        selectedCategory = item.title
                    } label: {
                        HStack {
                            if item.title != "All" {
                                Image(item.icon)
                                    //.resizable()
                                    .foregroundStyle(selectedCategory == item.title ? .yellow : .black)
                                    .frame(width: 90, height: 50)
                            }
                              
                            
                            Text(item.title)
                        }
                        
                        .padding()
                        .background(selectedCategory == item.title ? .yellow.opacity(0.6) : .gray.opacity(0.1))
                        .foregroundStyle(selectedCategory != item.title ? .black : .black)
                        .font(selectedCategory != item.title ? .headline : .title2)
                        .clipShape(Capsule())
                        
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}


//MARK: Product Card View
struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, 0)
                .rotationEffect(Angle(degrees: 0))
            
            ZStack {
                
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 45, weight: .semibold))

                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price)")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 95, height: 60)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                        }
                       // .padding(.horizontal, -13)
                        
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: . infinity)
                    .frame(height: 65)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                    
                })
            }
                
            }
            .padding(30)
            .frame(width: 350, height: 450)
            .background(product.color.opacity(0.13))
            .clipShape(.rect(cornerRadius: 57))
            .padding(.leading, 20)
        }
        
    }

