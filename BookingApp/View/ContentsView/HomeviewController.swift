//
//  HomeviewController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

final class HomeviewController: UIViewController {

  let collectionView = RecentlyWatchedView()
  let tableView = SearchListView()
  let searchField = UISearchBar()
  let searchFieldBtn = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureBasicSetting()
    configureUI()


  }
  
  private func configureBasicSetting(){

  }
  
  private func configureUI(){
    [
     collectionView,
     tableView
     
    ].forEach{self.view.addSubview($0)}
    
    collectionView.snp.makeConstraints{
      
    }
    
  }
}

extension HomeviewController: UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  
}
