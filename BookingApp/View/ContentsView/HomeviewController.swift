//
//  HomeviewController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

final class HomeviewController: UIViewController {
  private let titleLabel = ""

  lazy var listcollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 120, height: 120)
    layout.minimumLineSpacing = 10
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout:  layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(RecentlyWatchedViewCell.self, forCellWithReuseIdentifier: RecentlyWatchedViewCell.id)
    collectionView.register(RecentlyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "recentlyHeaderView")
    collectionView.showsHorizontalScrollIndicator = false
    return collectionView
  }()
  
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
     listcollectionView,
     tableView
     
    ].forEach{self.view.addSubview($0)}
    
    searchField.snp.makeConstraints{
      $0.width.equalTo(view.safeAreaLayoutGuide).inset(30)
      $0.height.equalTo(60)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide)
    }
    
    listcollectionView.snp.makeConstraints{
      $0.width.equalToSuperview().inset(30)
      $0.height.equalTo(120)
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyWatchedViewCell.id, for: indexPath)
    
    return cell
  }

  
}
