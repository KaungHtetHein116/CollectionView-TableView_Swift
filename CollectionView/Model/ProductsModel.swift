//
//  ProductsModel.swift
//  CollectionView
//
//  Created by Kaung Htet Hein on 10/22/21.
//

import Foundation


struct ProductModel: Codable {
    var response: [Product]
}

struct Product: Codable {
    var category: String
    var products: [ProductDetail]
}

struct ProductDetail: Codable {
    var name: String
    var image: String
    var price: String
    var description: String
}




