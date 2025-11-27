//
//  CartManager.swift
//  Babylon
//
//  Created by user278698 on 11/6/25.
//

import Foundation


class CartManager: ObservableObject{
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product){
        products.append(product)
        total += product.price
        
        
    }
    func removeFromCart(product: Product) {
       if let index = products.firstIndex(where: {
            $0.id == product.id
        }) {
           products.remove(at: index)
        total -= product.price 
    }
}
