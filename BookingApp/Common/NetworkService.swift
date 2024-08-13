//
//  NetworkService.swift
//  BookingApp
//
//  Created by bloom on 8/13/24.
//

import Foundation

class NetworkService {
  static let shared = NetworkService()
  let session = URLSession.shared
  private init(){}
  
  func fetchBooks(query: String,
                  page: Int,
                  completionHandler: @escaping (BookResponse) -> Void){
    var components = URLComponents(string: "https://dapi.kakao.com/v3/search/book")
    
    components?.queryItems = [
      URLQueryItem(name: "query", value: query),
      URLQueryItem(name: "size", value: "20"),
      URLQueryItem(name: "page", value: "\(page)")
    ]
    guard let url = components?.url else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.allHTTPHeaderFields = [
      "Authorization": "KakaoAK 4ad73036f5366f94754121d02999f8e9"
    ]
    URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
      if let error = error {
        print(error)
        return
      }
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
            (200..<300).contains(statusCode) else {
        return
      }
      if let data = data,
         let bookResponse = try?JSONDecoder().decode(BookResponse.self, from: data){
        completionHandler(bookResponse)
      }

      
      
    }.resume()
    
  }
}
