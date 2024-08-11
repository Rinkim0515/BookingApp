//
//  RecentViewedBookCell.swift
//  BookingApp
//
//  Created by bloom on 8/11/24.
//

import SnapKit
import UIKit

class RecentViewedBookCell: UICollectionViewCell {
  static let id = "RecentViewedBookCell"
  var urlString = ""
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureUI()
    self.makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.imageView.image = nil
  }
  private func configureUI(){
    self.contentView.addSubview(imageView)
    imageView.layer.cornerRadius = 35
    imageView.clipsToBounds = true
    imageView.backgroundColor = .systemGray
    imageView.kf.setImage(with: URL(string: urlString))
  }
  private func makeConstraints(){
    self.imageView.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
  }
}
