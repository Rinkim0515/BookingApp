//
//  BookDetailView.swift
//  BookingApp
//
//  Created by bloom on 8/2/24.
//

import UIKit
import Kingfisher
import SnapKit


class BookDetailView: UIViewController {
  let titlelabel = {
    let lb = UILabel()
    lb.text = "세이노의 가르침"
    return lb
    
  }()
  let authorLabel = {
    let lb = UILabel()
    lb.text = "세이노"
    return lb
    
  }()
  let bookImagelabel = {
    let lb = UIImageView()
    return lb
    
  }()
  let priceLabel = {
    let lb = UILabel()
    lb.text = "14,000원"
    return lb
    
  }()
/// 얘 스크롤 뷰
  let overviewLabel = {
    let lb = UILabel()
    
    return lb
    
  }()
  lazy var leftButton = {
    let btn = UIButton()
    btn.addTarget(self, action: #selector(goBackButton), for: .touchDown)
    return btn
    
  }()
  lazy var rightButton = {
    let btn = UIButton()
    btn.addTarget(self, action: #selector(addWishListButton), for: .touchDown)
    return btn
    
  }()
  
  override func viewDidLoad() {
    view.backgroundColor = .white
    configureUI()
  }
  
  func configureUI(
  ){}
  
  @objc func goBackButton(){}
  @objc func addWishListButton(){}
  
}
