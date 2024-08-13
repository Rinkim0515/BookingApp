//
//  ListViewModel.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import Foundation
import RxSwift
protocol SearchViewModelDelegate: AnyObject {
  func didFetchBook()
}

class SearchViewModel {
  weak var delegate: (any SearchViewModelDelegate)?
  private(set) var resultItems: [[Book]] = [[], []]
  private(set) var currentPage = 1
  private(set) var isEnd = false
  
  func setCurrentPage(_ page: Int) {
    self.currentPage = page
  }
  func setResultItemSecondSection(_ books: [Book]){
    self.resultItems[1] = books
  }
  func setIsEnd(_ isEnd: Bool) {
    self.isEnd = isEnd
  }
  
  func removeAndInsertToFirstInResultItemFirstSection(removeIndex: Int){
    let removed = resultItems[0].remove(at: removeIndex)
    self.resultItems[0].insert(removed, at: 0)
    
  }
  func insertToFirstInResultItemSecondSection(_ book: Book) {
    self.resultItems[0].insert(book, at: 0)
  }
  func appendToResultItemSecondSection(_ books: [Book]) {
    self.resultItems[1].append(contentsOf: books)
  }
  
  func fetchBooks(query: String) {
    NetworkService.shared.fetchBooks(query: query,
                                     page: self.currentPage) {
      
      [weak self] bookResponse in
      guard let self = self else { return }
      self.appendToResultItemSecondSection(bookResponse.documents)
      self.setIsEnd(bookResponse.meta.isEnd)
      
      if !self.isEnd {
        self.setCurrentPage(self.currentPage + 1)
      }
      self.delegate?.didFetchBook()
      

 
      
    }
  }
}
