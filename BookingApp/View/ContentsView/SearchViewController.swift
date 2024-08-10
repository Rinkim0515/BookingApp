//
//  HomeviewController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit
import RxSwift

final class SearchViewController: UIViewController {
  
  var resultItems: [Book] = []
  private var searchBar = UISearchBar()
  private lazy var searchListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
  
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "magnifyingglass"), tag: 0)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  

  

  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    
  }
 
  
  
  private func configureUI(){
    self.view.addSubview(searchBar)
    self.view.addSubview(searchListCollectionView)
    self.searchListCollectionView.register(SearchResultItemCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultItemCollectionViewCell.id)
    self.searchListCollectionView.delegate = self
    self.searchListCollectionView.dataSource = self
  }
  
  
  private func makeConstraints(){
    self.searchBar.snp.makeConstraints{
      $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
    }
    self.searchListCollectionView.snp.makeConstraints{
      $0.top.equalTo(self.searchBar.snp.bottom)
      $0.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }

  }
}

extension SearchViewController {
  func createLayout() -> UICollectionViewCompositionalLayout {
    let config = UICollectionLayoutListConfiguration(appearance: .plain)
    return UICollectionViewCompositionalLayout.list(using: config)
  }
}


