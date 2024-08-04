//
//  ListViewModel.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import Foundation

class ListViewModel {
  
  
  
  
  func temp(){
    let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=세이노")!
    
    var request = URLRequest(url: url)
    
    request.allHTTPHeaderFields = ["Authorization": "KakaoAK <4ad73036f5366f94754121d02999f8e9>"]
    
    URLSession.shared.dataTask(with: request) { data, _, _ in
      print(String(data: data!, encoding: .utf8))
    }.resume()
  }

  
}
