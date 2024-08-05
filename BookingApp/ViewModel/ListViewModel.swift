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
  
  
  let ListSubject = BehaviorSubject(value: [Document]())
  
  init(){
    fetchSearchList(query: "세이노")

  }
  
  
  func fetchSearchList(query: String){
    let urlString = "https://dapi.kakao.com/v3/search/book?query=\(query)"
    
    guard let safeUrl = URL(string: urlString)
    else {
      print(#function)
      ListSubject.onError(NetworkError.invalidURL)
      return
    }
    
    NetworkController.shared.fetch(url: safeUrl)
      .subscribe(onSuccess: {[weak self] (response:BookResponse) in
        
        
        self?.ListSubject.onNext(response.documents)
      },
                 onFailure: {[weak self] error in
        self?.ListSubject.onError(error)})
      .disposed(by: disposedBag)
  }
  
  


  
}
