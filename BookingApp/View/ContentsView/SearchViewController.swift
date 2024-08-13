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
  
  let viewModel: SearchViewModel
  
  var searchBar = UISearchBar()
  lazy var searchListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
  
  init(viewModel: SearchViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    self.viewModel.delegate = self
    self.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
  }
  

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  

  

  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.configureUI()
    self.makeConstraints()

    
  }
 
  
  
  private func configureUI(){
    self.view.addSubview(searchBar)
    self.view.addSubview(searchListCollectionView)
    self.searchListCollectionView.delegate = self
    self.searchListCollectionView.dataSource = self
    self.searchListCollectionView.register(SearchResultItemCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultItemCollectionViewCell.id)
    self.searchListCollectionView.register(RecentViewedBookCell.self, forCellWithReuseIdentifier: RecentViewedBookCell.id)
    self.searchListCollectionView.register(SearchResultCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchResultCollectionReusableView.id)
    self.searchListCollectionView.prefetchDataSource = self
    self.searchBar.delegate = self
  }
  
  
  private func makeConstraints(){
    
    self.searchBar.snp.makeConstraints{
      $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
    }
    self.searchListCollectionView.snp.makeConstraints{
      $0.top.equalTo(self.searchBar.snp.bottom)
      $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
        $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }

  }
}

extension SearchViewController: SearchViewModelDelegate {
  
  func didFetchBook() {
    DispatchQueue.main.async {
      self.searchListCollectionView.reloadSections(.init(integer: 1))
    }
  }
}


