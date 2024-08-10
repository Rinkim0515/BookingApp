//
//  Extension.swift
//  BookingApp
//
//  Created by bloom on 8/8/24.
//


import UIKit





extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource {
  
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
  
  
  
}


