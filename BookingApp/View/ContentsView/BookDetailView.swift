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
    lb.textAlignment = .center
    return lb
    
  }()
  let authorLabel = {
    let lb = UILabel()
    lb.text = "세이노"
    lb.textAlignment = .center
    lb.textColor = .darkGray
    return lb
    
  }()
  let bookImagelabel = {
    let lb = UIImageView()
    lb.backgroundColor = .blue
    return lb
    
  }()
  let priceLabel = {
    let lb = UILabel()
    lb.text = "14,000원"
    lb.textAlignment = .center
    return lb
    
  }()
/// 얘 스크롤 뷰
  let overviewLabel = {
    let lb = UILabel()
    lb.textAlignment = .center
    lb.text = "  private func bind()asdasadd"


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
  
  func configureUI(){
    [
      titlelabel,
      authorLabel,
      bookImagelabel,
      priceLabel,
      overviewLabel,
      leftButton,
      rightButton
    ].forEach{self.view.addSubview($0)}
    
    titlelabel.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(30)
      $0.width.equalTo(180)
      $0.height.equalTo(40)
      
    }
    authorLabel.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.top.equalTo(titlelabel.snp.bottom).offset(30)
      $0.width.equalTo(100)
      $0.height.equalTo(40)
      
    }
    bookImagelabel.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.top.equalTo(authorLabel.snp.bottom).offset(30)
      $0.width.equalTo(240)
      $0.height.equalTo(360)
      
    }
    priceLabel.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.top.equalTo(bookImagelabel.snp.bottom).offset(30)
      $0.width.equalTo(100)
      $0.height.equalTo(40)
      
    }
    overviewLabel.snp.makeConstraints{
      $0.centerX.equalToSuperview()
      $0.top.equalTo(priceLabel.snp.bottom).offset(30)
      $0.width.equalTo(100)
      $0.height.equalTo(40)
      
    }
    
    
    
    
  }
  
  func bindData(with docs: Document){
    let urlString = docs.thumbnail
    let url = URL(string: urlString!)
    DispatchQueue.main.async {
      self.authorLabel.text = docs.authors[0]
      self.overviewLabel.text = docs.contents
      self.priceLabel.text = "\(docs.price)"    
      self.bookImagelabel.kf.setImage(with: url)
    }
    
  }
  
  @objc func goBackButton(){}
  @objc func addWishListButton(){}
  
}
