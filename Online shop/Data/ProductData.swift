//
//  ProductData.swift
//  Online shop
//
//  Created by salome on 10.12.23.
//

import SwiftUI

struct ProductData: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: Double
    
}

struct ProductList {
    static let allProduct = [
        ProductData(imageName: "Orange",
                    name: "Orange",
                    price: 4.50),
        ProductData(imageName: "Apple",
                    name: "Apple",
                    price: 2.50),
        ProductData(imageName: "Banana",
                    name: "Banana",
                    price: 3.90),
        ProductData(imageName: "Brocoli",
                    name: "Broccoli",
                    price: 4.50),
        ProductData(imageName: "Tomato",
                    name: "Tomato",
                    price: 4.50),
        ProductData(imageName: "Carrot",
                    name: "Carrot",
                    price: 4.50),
        
    ]
}
