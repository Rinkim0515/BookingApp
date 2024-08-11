//
//  Extension.swift
//  BookingApp
//
//  Created by bloom on 8/8/24.
//


import UIKit





extension SearchViewController: UICollectionViewDataSource {
  
  func createLayout() -> UICollectionViewCompositionalLayout {
    let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(0)),
      elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    return UICollectionViewCompositionalLayout { section, env in
      switch section {
      case 0:
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalHeight(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalHeight(1.0), heightDimension: .absolute(70)), subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(15)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.boundarySupplementaryItems = [supplementaryItem]
        section.orthogonalScrollingBehavior = .continuous
        return section
      default:
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.headerMode = .supplementary
        let section = NSCollectionLayoutSection.list(using: config, layoutEnvironment: env)
        section.boundarySupplementaryItems = [supplementaryItem]
        return section
        
      }
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let resultItem = self.resultItems[indexPath.section][indexPath.row]
    switch indexPath.section {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentViewedBookCell.id, for: indexPath) as! RecentViewedBookCell
      cell.imageView.kf.setImage(with: URL(string: resultItem.thumbnail))
      return cell
      
    default:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultItemCollectionViewCell.id, for: indexPath) as! SearchResultItemCollectionViewCell
      cell.setLabelText(title: resultItem.title, authors: resultItem.authors, price: resultItem.price)
      return cell
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.resultItems[section].count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.resultItems.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchResultCollectionReusableView.id, for: indexPath) as! SearchResultCollectionReusableView
    headerView.setTitle(on: indexPath.section)
    return headerView
  }
  
}

extension SearchViewController: UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailVC = DetailBookViewController()
    let selectedItem = self.resultItems[indexPath.section][indexPath.row]
    detailVC.selectedItem = selectedItem
    detailVC.delegate = self
    
    if indexPath.section == 1 {
      self.addRecentViewBook(selectedItem)
      
    }
    
    self.present(detailVC, animated: true)
  }
  private func addRecentViewBook( _ book: Book) {
    if let alreadyIn = self.resultItems[0].firstIndex( where: {
      $0 == book} )
    {
      self.resultItems[0].remove(at: alreadyIn)
      self.resultItems[0].insert(book, at: 0)
    } else {
      self.resultItems[0].insert(book, at: 0)
    }
    DispatchQueue.main.async {
      self.searchListCollectionView.reloadSections(IndexSet(integer: 0))
    }
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
        self?.resultItems[1] = bookResponse.documents
        
        DispatchQueue.main.async {
          self?.searchListCollectionView.reloadData()
          
        }
      }
      
      
    }.resume()
    
  }
  
  
}


extension SearchViewController: DetailBookViewControllerDelegate {
  
  func didCompleteSave(bookName: String) {
    let message = "<\(bookName)> 가 즐겨찾기에 추가되었습니다!"
    let alertController = UIAlertController(title: "담기완료", message: message, preferredStyle: .alert)
    
    alertController.addAction(.init(title: "확인", style: .default))
    self.present(alertController, animated: true)
  }
}
