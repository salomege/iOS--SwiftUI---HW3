//
//  ContentView.swift
//  Online shop
//
//  Created by salome on 10.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var product: [ProductData] = ProductList.allProduct

    var body: some View {
        NavigationView {
            List {
                ForEach(product, id: \.id) { productData in
                    ScrollView {
                        HStack {
                            Image(productData.imageName)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaledToFill()
                            
                            VStack(spacing: 8) {
                                Text(productData.name)
                                    .font(.title2)
                                
                                Text("$\(productData.price, specifier: "%.2f")")
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.addToCart(product: productData)
                            }) {
                                Image(systemName: "cart.badge.plus")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                            }
                            
                            Text("\(viewModel.getQuantity(for: productData))")
                            
                            Button(action: {
                                viewModel.removeCart(product: productData)
                            }) {
                                Image(systemName: "cart.badge.minus")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                            }
                            
                            Button(action: {
                                if let index = product.firstIndex(where: { $0.id == productData.id }) {
                                    product.remove(at: index)
                                }
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    product.remove(atOffsets: indexSet)
                }
            }
            .environmentObject(viewModel)
        }
        
        HStack{
            Text("Toal Quantity: \(viewModel.calculateTotal().quantity)")
                .font(
                        .system(size: 20)
                        .weight(.heavy)

                    )
            Spacer()
            Text("Total price: $\(viewModel.calculateTotal().totalPrice, specifier: "%.2f")")
                .font(
                        .system(size: 20)
                        .weight(.heavy)

                    )
        }
        .padding()
        }
    }

#Preview {
    ContentView()
}
