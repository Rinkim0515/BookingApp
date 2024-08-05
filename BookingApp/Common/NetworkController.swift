//
//  NetworkController.swift
//  BookingApp
//
//  Created by bloom on 8/6/24.
//

import Foundation
import RxSwift


enum NetworkError: Error {
  case invalidURL
  case dataFetchFail
  case decodingFail
}



class NetworkController {
  
  static let shared = NetworkController()
  
  let S_BASE_URL = "https://dapi.kakao.com/v3/search/book?query="
  let API_KEY = "4ad73036f5366f94754121d02999f8e9"
  
  private init(){}
  
//  func fetchURL() -> URL{}
//    
//  }
  
//  let url = URL(string: self.BASE_URL + query)!
  
  func temp(){
    let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=세이노")!
    
    
  }
  
  
  
  func fetch<T: Decodable>(url: URL) -> Single<T> {
    
    
    
    return Single.create(subscribe: {
      observer in
      
      
      
      var request = URLRequest(url: url)
      request.allHTTPHeaderFields = ["Authorization": "KakaoAK 4ad73036f5366f94754121d02999f8e9"]
      
      
      URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let error = error { observer(.failure(error))
          return }
        
        guard let safeData = data,
              let response = response as? HTTPURLResponse,(200..<300).contains(response.statusCode)
                
        else {
          if let response = response as? HTTPURLResponse {
            print("Status Code : ", response.statusCode)
          }
          observer( .failure(NetworkError.dataFetchFail))
          return
        }
        
        do {
          let decodeData = try JSONDecoder().decode(T.self, from: safeData)
          observer(.success(decodeData))
        } catch {
          observer( .failure(NetworkError.decodingFail))
        }
        
        
      }.resume()
      return Disposables.create()
    })
  }
  
  
  
}
