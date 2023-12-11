//
//  ViewModel.swift
//  Online shop
//
//  Created by salome on 10.12.23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published private var cart: [UUID: Int] = [:]
  

    func addToCart(product: ProductData) {
        if let quantity = cart[product.id] {
            cart[product.id] = quantity + 1
        } else {
            cart[product.id] = 1
        }
        print("Added to cart: \(product.name), Quantity: \(cart[product.id] ?? 0)")
        objectWillChange.send()
    }

    func removeCart(product: ProductData) {
        if let quantity = cart[product.id], quantity > 0 {
            cart[product.id] = quantity - 1
         }
        
        print("Added to cart: \(product.name), Quantity: \(cart[product.id] ?? 0)")
        objectWillChange.send()
    }
    
    func getQuantity(for product: ProductData) -> Int {
        return cart[product.id] ?? 0
    }
    
    func calculateTotal() -> (quantity: Int, totalPrice: Double) {
        let quantity = cart.values.reduce(0, +)
        let totalPrice = cart.reduce(0.0) { (result, entry) in
            let (productId, quantity) = entry
            if let product = ProductList.allProduct.first(where: { $0.id == productId }) {
                return result + (Double(quantity) * product.price)
            } else {
                return result
            }
        }
        return (quantity, totalPrice)
    }
}
