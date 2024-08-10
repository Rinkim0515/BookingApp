//
//  ListViewModel.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import Foundation
import RxSwift

class ListViewModel {
  
  private let disposedBag = DisposeBag()
  private var isSearching = false
  var query = ""
  var urlString: String{ return "https://dapi.kakao.com/v3/search/book?query=\(query)" }
  let ListSubject = BehaviorSubject(value: [Document]())
  

  
  
  func fetchSearchList(){
    print(urlString)
    guard !isSearching else{ return }
    isSearching = true
    guard let safeUrl = URL(string: urlString)
    else {
      print(#function)
      ListSubject.onError(NetworkError.invalidURL)
      return
    }
    
    NetworkController.shared.fetch(url: safeUrl)
      .subscribe(onSuccess: {[weak self] (response:BookResponse) in
        
        self?.ListSubject.onNext(response.documents)
        self?.isSearching = false
      },
                 onFailure: {[weak self] error in
        self?.ListSubject.onError(error)
        self?.isSearching = false
      })
      .disposed(by: disposedBag)
  }
  
  


  
}
