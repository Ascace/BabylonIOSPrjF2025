//
//  Product.swift
//  Babylon
//
//  Created by user278698 on 11/6/25.
//

import Foundation

struct Product : Identifiable{
    var id =  UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
    
    
}

var productList = [
    Product(name: "Leather Couch",
            image: "fn1",
            description: "",
            supplier: "IKEA",
            price:350),
    Product(name: "Nice Couch",
            image: "f21",
            description: "",
            supplier: "IKEA",
            price:350),
    Product(name: "Gray Couch",
            image: "f3",
            description: "",
            supplier: "IKEA",
            price:350),
    Product(name: "Beautiful Couch",
            image: "fn6",
            description: "",
            supplier: "IKEA",
            price:350),
    Product(name: "Outdoor Couch",
            image: "f5",
            description: "",
            supplier: "IKEA",
            price:350),
    Product(name: "Cup shape Couch",
            image: "fn6",
            description: "",
            supplier: "IKEA",
            price:350)
]
