//
//  WishListController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

class WishListController: UIViewController {
  var storedBooks: [BookEntity] = [] {
    didSet {
      DispatchQueue.main.async {
        self.listCollectionView.reloadData()
      }
    }
  }
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
    self.storedBooks = CoreDataService.shared.fetchStoredBooks()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.storedBooks = CoreDataService.shared.fetchStoredBooks()
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
    deleteBtn.addTarget(self, action: #selector(deleteAllStoredBooks), for: .touchUpInside)
    addBtn.setTitle("추가", for: .normal)
    addBtn.setTitleColor(.systemGray, for: .normal)
    addBtn.addTarget(self, action: #selector(addNewBook), for: .touchUpInside)
    listCollectionView.dataSource = self
    listCollectionView.register(SearchResultItemCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultItemCollectionViewCell.id)

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
  @objc func deleteAllStoredBooks(){
    CoreDataService.shared.deleteAllStoredBooks()
    self.storedBooks = []
  }
  @objc func addNewBook(){
    self.tabBarController?.selectedIndex = 0
    (self.tabBarController?.viewControllers?[0] as? SearchViewController)?.searchBar.becomeFirstResponder()
    
  }
}
extension WishListController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    storedBooks.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultItemCollectionViewCell.id, for: indexPath) as! SearchResultItemCollectionViewCell
    let storedBook = self.storedBooks[indexPath.row]
  
    cell.setLabelText(title: storedBook.title ?? "", authors: storedBook.authors!.components(separatedBy: ","), price: Int(storedBook.price))
    return cell
  }
  
  
}

extension WishListController: UICollectionViewDelegate {
  

}
