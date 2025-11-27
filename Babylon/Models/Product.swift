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
            description: "Premium leather sofa with modern design and exceptional comfort",
            supplier: "IKEA",
            price:350),
    Product(name: "Nice Couch",
            image: "f21",
            description: "Stylish and comfortable couch perfect for any living room",
            supplier: "IKEA",
            price:350),
    Product(name: "Gray Couch",
            image: "f3",
            description: "Elegant gray sofa with contemporary styling",
            supplier: "IKEA",
            price:350),
    Product(name: "Beautiful Couch",
            image: "f5",
            description: "Beautiful design with plush cushions and sturdy frame",
            supplier: "IKEA",
            price:350),
    Product(name: "Outdoor Couch",
            image: "fn6",
            description: "Weather-resistant outdoor sofa for your patio or deck",
            supplier: "IKEA",
            price:350),
    Product(name: "Cup shape Couch",
            image: "fn1",
            description: "Unique cup-shaped design for modern spaces",
            supplier: "IKEA",
            price:350)
]
