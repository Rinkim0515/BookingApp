//
//  ViewController.swift
//  BookingApp
//
//  Created by bloom on 8/2/24.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  let firstVC = HomeviewController()
  let firstNavController = UINavigationController(rootViewController: firstVC)
  let secondVC = WishListController()
  let secondNavController = UINavigationController(rootViewController: firstVC)
  
  viewcontrollers = [firstNavController, secondNavController]


}

