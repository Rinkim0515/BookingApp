//
//  HomeviewController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

final class HomeviewController: UIViewController {

  let collectionView = RecentlyWatchedViewCell()
  let tableView = SearchListView()
  lazy var searchField = {
    let temp = UISearchBar()
    temp.placeholder = "Search"
    temp.setImage(UIImage(named: "icSearchNonW"), for: UISearchBar.Icon.search, state: .normal)
    temp.layer.borderColor = UIColor.clear.cgColor
    temp.searchBarStyle = .minimal

    return temp
  }()
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
     searchField,
     collectionView,
     tableView
     
    ].forEach{self.view.addSubview($0)}
    
    searchField.snp.makeConstraints{
      $0.width.equalTo(view.safeAreaLayoutGuide)
      $0.height.equalTo(60)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide)
    }
    
    collectionView.snp.makeConstraints{
      $0.width.equalToSuperview().inset(-20)
      $0.height.equalTo(100)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(searchField.snp.bottom).offset(40)
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
