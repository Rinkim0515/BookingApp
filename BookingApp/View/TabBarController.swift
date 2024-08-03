//
//  ViewController.swift
//  BookingApp
//
//  Created by bloom on 8/2/24.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController {
  private let firstVC = HomeviewController()
  private let secondVC = WishListController()
  
  ///탭바 폰트 사이즈 설정
  private let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    
  }
  
  
  private func configureUI(){
    
    firstVC.tabBarItem = UITabBarItem(title: "도서검색", image: nil, tag: 0)
    secondVC.tabBarItem = UITabBarItem(title: "즐겨찾기", image: nil, tag: 1)
    
    [
      firstVC,
      secondVC
    ].forEach{
      $0.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
      $0.tabBarItem.setTitleTextAttributes(attributes, for: .selected)
    }
    self.setViewControllers([firstVC, secondVC], animated: true)
  }
  
  
  
}
