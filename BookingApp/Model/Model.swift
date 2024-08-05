//
//  Model.swift
//  BookingApp
//
//  Created by bloom on 8/6/24.
//

import Foundation


struct BookResponse: Codable {
    let documents: [Document]

}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents: String
    let price: Int
    let salePrice: Int
    let thumbnail: String
    let title: String



    enum CodingKeys: String, CodingKey {
        case authors, contents, price
        case salePrice = "sale_price"
        case thumbnail, title
    }
}
