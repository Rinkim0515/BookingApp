//
//  Extension.swift
//  BookingApp
//
//  Created by bloom on 8/8/24.
//


import UIKit





extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource {
  
  func createLayout() -> UICollectionViewCompositionalLayout {
    var config = UICollectionLayoutListConfiguration(appearance: .plain)
    config.headerMode = .supplementary
    
    return UICollectionViewCompositionalLayout.list(using: config)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultItemCollectionViewCell.id, for: indexPath) as! SearchResultItemCollectionViewCell
    let book = self.resultItems[indexPath.row]
    cell.setLabelText(title: book.title, authors: book.authors, price: book.price)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.resultItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    
  }
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchResultCollectionReusableView.id, for: indexPath)
  }
  
  
}

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
  }
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    guard let keyword = searchBar.text
    else { return }
    
    var components = URLComponents(string: "https://dapi.kakao.com/v3/search/book")
    
    components?.queryItems = [
      URLQueryItem(name: "query", value: keyword),
      URLQueryItem(name: "size", value: "20")
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
         let bookResponse = try?JSONDecoder().decode(BookResponse.self, from: data) {
        self?.resultItems = bookResponse.documents
        
        DispatchQueue.main.async {
          self?.searchListCollectionView.reloadData()
          
        }
      }
      
      
    }.resume()
    
  }
  
  
}


