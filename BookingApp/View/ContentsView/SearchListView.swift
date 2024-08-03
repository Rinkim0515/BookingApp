//
//  SearchListView.swift
//  BookingApp
//
//  Created by bloom on 8/3/24.
//

import UIKit

class SearchListView: UITableViewCell {
  let title = "검색 결과"
  
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
  
}


class RecentlyWatchedView: UICollectionViewCell {
  let title = "최근 본 책"
  let imageLabel = {
    let il = UIImageView()
    il.contentMode = .scaleAspectFit
    return il
  }()
  
  
}
