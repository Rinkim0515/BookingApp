//
//  Model.swift
//  BookingApp
//
//  Created by bloom on 8/6/24.
//

import Foundation

struct BookResponse: Decodable {
  let meta: Meta
  let documents: [Book]
  
}
struct Meta: Decodable {
  let isEnd: Bool
  let pageableCount: Int
  let totalCount: Int
  
  enum CodingKeys: String,CodingKey {
    case isEnd = "is_end"
    case pageableCount = "pageable_count"
    case totalCount = "total_count"
  }
}

// MARK: - Document
struct Book: Decodable, Equatable {
  let authors: [String]
  let contents: String
  let price: Int
  let salePrice: Int
  let thumbnail: String
  let title: String
  let isbn: String
  enum CodingKeys: String, CodingKey {
    case authors, contents, price, isbn
    case salePrice = "sale_price"
    case thumbnail, title
  }
}
