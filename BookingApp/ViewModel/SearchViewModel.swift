//
//  ListViewModel.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import Foundation
import RxSwift

class SearchViewModel {
  var resultItems: [[Book]] = [[], []]
  var currentPage = 1
  var isEnd = false
  
  func removeAndInsertToFirstInResultItemSecondSection(removeIndex: Int){
    let removed = resultItems[0].remove(at: removeIndex)
    self.resultItems[0].insert(removed, at: 0)
    
  }
  func insertToFirstInResultItemSecondSection(_ book: Book) {
    self.resultItems[0].insert(book, at: 0)
  }
  
}
