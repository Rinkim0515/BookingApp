//
//  SearchListView.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit
import SnapKit

class SearchResultItemCollectionViewCell: UICollectionViewCell {
  
  static let id = "SearchResultItemCollectionViewCell"
  
  let titleLabel = UILabel()
  let authorLabel = UILabel()
  let priceLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureUI()
    self.makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func makeConstraints(){
    titleLabel.snp.makeConstraints{
      $0.verticalEdges.equalToSuperview().inset(20)
      $0.leading.equalToSuperview().inset(10)
    }
    titleLabel.setContentHuggingPriority(.init(1), for: .horizontal)
    authorLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
    authorLabel.snp.makeConstraints{
      $0.verticalEdges.equalTo(titleLabel)
      $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
    }
    priceLabel.snp.makeConstraints{
      $0.verticalEdges.equalTo(titleLabel)
      $0.leading.equalTo(authorLabel.snp.trailing).offset(5)
      $0.trailing.equalToSuperview().inset(15)
    }
  }
  private func configureUI(){
    [
     titleLabel,
     authorLabel,
     priceLabel
    ].forEach {
      self.contentView.addSubview($0)
    }
    titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
    authorLabel.font = .systemFont(ofSize: 16)
    authorLabel.textColor = .systemGray
    priceLabel.font = .systemFont(ofSize: 16)
    priceLabel.textColor = .red

  }
  
  func setLabelText(title: String, authors: [String], price: Int) {
    self.titleLabel.text = title
    self.authorLabel.text = authors.joined(separator: ",")
    self.priceLabel.text = "\(price)원"
  }
  
}


class SearchResultCollectionReusableView: UICollectionReusableView {
  static let id = "SearchResultCollectionReusableView"
  
  let titleLabel = {
    let x = UILabel()
    x.text = "검색결과"
    x.textAlignment = .left
    x.textColor = .black
    x.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    return x
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureUI()
    self.makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI(){
    self.backgroundColor = .white
    self.addSubview(titleLabel)
  }
  private func makeConstraints(){
    self.snp.makeConstraints{
      $0.height.equalTo(40)
    }
    titleLabel.snp.makeConstraints{
      $0.horizontalEdges.equalToSuperview().inset(16)
      $0.verticalEdges.equalToSuperview()
    }
  }
}

