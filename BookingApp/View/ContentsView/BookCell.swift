//
//  SearchListView.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

class SearchListView: UITableViewCell {
  
  static let id = "searchListViewCell"
  
  let titleLabel = {
    let lb = UILabel()
    lb.text = "세이노의 가르침"
    return lb
  }()
  let authorLabel = {
    let lb = UILabel()
    lb.text = "세이노"
    return lb
    
  }()
  let priceLabel = {
    let lb = UILabel()
    lb.text = "14,000" // 형변환 아마도 필요할듯 int로 받지않을까? 그리고 컴마 추가
    return lb
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI(){
    [
     titleLabel,
     authorLabel,
     priceLabel
    
    ].forEach{contentView.addSubview($0)}
    
    titleLabel.snp.makeConstraints{
      $0.centerY.equalTo(contentView)
      $0.leading.equalTo(contentView).offset(20)
      $0.width.equalTo(100)
      $0.height.equalTo(50)
    }
    
  }
  
}


class RecentlyWatchedViewCell: UICollectionViewCell {
  static let id = "recentlyWatchedViewCell"
  let title = "최근 본 책" //헤더 이름 만들어야함
  
  let imageLabel = {
    let il = UIImageView()
    il.contentMode = .scaleAspectFit
    
    il.image = UIImage(named: "pokemonBall")
    il.layer.cornerRadius = 50
    
    il.layer.borderWidth = 1.0
    il.layer.borderColor = UIColor.red.cgColor
    
    return il
  }()
  

  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  private func configureUI(){
    
    [
      imageLabel
    ].forEach{self.addSubview($0)}
    
    imageLabel.snp.makeConstraints{
      $0.centerX.centerY.equalTo(self)
      $0.width.height.equalTo(self).inset(10)
      
      
    }
    
  }
  
}

class RecentlyHeaderView: UICollectionReusableView {
  
  static let id = "recentlyHeaderView"
  private let titleLabel = {
    let lb = UILabel()
    lb.text = "최근 본 책"
    lb.textAlignment = .left
    lb.textColor = .black
    lb.font = .systemFont(ofSize: 20)
    return lb
  }()
  func configure(){
    backgroundColor = .clear
    addSubview(titleLabel)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame = bounds
  }
}


class favoritesCell: UITableViewCell {
  
  static let id = "favoritesCell"
  
  let titleLabel = {
    let lb = UILabel()
    lb.text = "세이노의 가르침"
    return lb
  }()
  let authorLabel = {
    let lb = UILabel()
    lb.text = "세이노"
    return lb
    
  }()
  let priceLabel = {
    let lb = UILabel()
    lb.text = "14,000" // 형변환 아마도 필요할듯 int로 받지않을까? 그리고 컴마 추가
    return lb
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI(){
    [
     titleLabel,
     authorLabel,
     priceLabel
    
    ].forEach{contentView.addSubview($0)}
    
    titleLabel.snp.makeConstraints{
      $0.centerY.equalTo(contentView)
      $0.leading.equalTo(contentView).offset(20)
      $0.width.equalTo(100)
      $0.height.equalTo(50)
    }
    
  }

}
