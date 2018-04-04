//
//  DetailViewController.swift
//  CitiAnimationTest
//
//  Created by Luis Arias on 3/24/18.
//  Copyright © 2018 Luis Arias. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    
    let b = UIButton()
    b.addTarget(self, action: #selector(hola), for: .touchUpInside)
    view.addSubview(b)
  }
  
  @objc func hola() {
    dismiss(animated: true, completion: nil)
  }
}
