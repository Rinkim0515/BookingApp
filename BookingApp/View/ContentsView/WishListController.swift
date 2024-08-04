//
//  WishListController.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

class WishListController: UIViewController {
  
  
  lazy var favoritesList = {
    let tv = UITableView()
    tv.delegate = self
    tv.dataSource = self
    tv.register(favoritesCell.self, forCellReuseIdentifier: favoritesCell.id)
    return tv
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()

    view.backgroundColor = .white
  }

  func configureUI(){
    [
      favoritesList
    ].forEach{self.view.addSubview($0)}
    
    favoritesList.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview().offset(-50)
      $0.width.equalToSuperview().inset(30)
      $0.height.equalTo(400)
    }
  }
}








extension WishListController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: favoritesCell.id, for: indexPath)
    
    return cell
  }
  
  
  
}
