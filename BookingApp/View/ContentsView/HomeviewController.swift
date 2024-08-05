//
//  HomeviewController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit
import RxSwift

final class HomeviewController: UIViewController {
  
  let list = ListViewModel()
  private let disposeBag = DisposeBag()
  private var listSubject = [Document]()
  
  
  
  private let firstTitleLabel = {
    let lb = UILabel()
    lb.text = "최근 본 책"
    lb.font = UIFont.boldSystemFont(ofSize: 30)
    lb.textAlignment = .left
    return lb
  }()
  
  private let secondTitleLabel = {
    let lb = UILabel()
    lb.text = "검색 결과"
    lb.font = UIFont.boldSystemFont(ofSize: 30)
    lb.textAlignment = .left
    return lb
  }()

  lazy var listcollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 120, height: 120)
    layout.minimumLineSpacing = 10
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout:  layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(RecentlyWatchedViewCell.self, forCellWithReuseIdentifier: RecentlyWatchedViewCell.id)
    

    collectionView.showsHorizontalScrollIndicator = true
    return collectionView
  }()
  
  lazy var SearchTableView = {
    let tv = UITableView()
    tv.delegate = self
    tv.dataSource = self
    tv.register(SearchListView.self, forCellReuseIdentifier:  SearchListView.id)
    
    
    return tv
  }()
  
  
  
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
    bind()
    


  }
  
  
  func bind(){
    list.ListSubject
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: {[weak self] lists in
        self?.listSubject = lists
        print(lists)
      },onError: {error in
        print(error)
      }).disposed(by: disposeBag)
    

  }
  
  private func configureBasicSetting(){


  }
  
  private func presentVC(){
    let deailVC = BookDetailView()
    present(deailVC, animated: true)
  }
  
  private func configureUI(){
    [
      searchField,
     firstTitleLabel,
     listcollectionView,
      secondTitleLabel,
      SearchTableView
     
    ].forEach{self.view.addSubview($0)}
    
    searchField.snp.makeConstraints{
      $0.width.equalTo(view.safeAreaLayoutGuide).inset(30)
      $0.height.equalTo(60)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide)
    }
    firstTitleLabel.snp.makeConstraints{
      $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(30)
      $0.top.equalTo(searchField.snp.bottom).offset(20)
    }
    
    listcollectionView.snp.makeConstraints{
      $0.width.equalToSuperview().inset(30)
      $0.height.equalTo(120)
      $0.centerX.equalToSuperview()
      $0.top.equalTo(firstTitleLabel.snp.bottom).offset(10)
    }
    
    secondTitleLabel.snp.makeConstraints{
      $0.leading.equalTo(firstTitleLabel.snp.leading)
      $0.top.equalTo(firstTitleLabel.snp.bottom).offset(160)
    }
    SearchTableView.snp.makeConstraints{
      $0.top.equalTo(secondTitleLabel.snp.bottom).offset(10)
      $0.height.equalTo(300)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().inset(30)
      
    }
    
  }
}

extension HomeviewController: UITableViewDelegate,UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      60
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchListView.id, for: indexPath) as? SearchListView
    else { return UITableViewCell()}
    
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presentVC()
  }
  
}

extension HomeviewController: UICollectionViewDelegate,UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyWatchedViewCell.id, for: indexPath)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presentVC()
  }
}
