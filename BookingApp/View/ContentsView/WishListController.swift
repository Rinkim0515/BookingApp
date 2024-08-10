//
//  WishListController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

class WishListController: UIViewController {
  private let titleLabel = UILabel()
  private let deleteBtn = UIButton()
  private let addBtn = UIButton()
  private lazy var listCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.tabBarItem = UITabBarItem(title: "WishList", image: UIImage(systemName: "hand.thumbsup.fill"), tag: 0)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureUI()
    self.makeConstraints()
  }

  
  func configureUI(){
    [
      titleLabel,
      listCollectionView,
      addBtn,
      deleteBtn
    ].forEach {
      self.view.addSubview($0)
    }
    view.backgroundColor = .white
    titleLabel.text = "담은책"
    titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    deleteBtn.setTitle("전체 삭제", for: .normal)
    deleteBtn.setTitleColor(.systemGray, for: .normal)
    addBtn.setTitle("추가", for: .normal)
    addBtn.setTitleColor(.systemGray, for: .normal)
    

  }
  private func makeConstraints(){
    titleLabel.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(10)
    }
    deleteBtn.snp.makeConstraints{
      $0.top.equalTo(titleLabel)
      $0.leading.equalTo(self.view.safeAreaLayoutGuide).inset(16)
    }
    addBtn.snp.makeConstraints{
      $0.top.equalTo(titleLabel)
      $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
    }
    listCollectionView.snp.makeConstraints{
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      $0.horizontalEdges.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
    
  }
  
  
}









extension WishListController {
  func createLayout() -> UICollectionViewCompositionalLayout {
    let config = UICollectionLayoutListConfiguration(appearance: .plain)
    return UICollectionViewCompositionalLayout.list(using: config)
  }
}
