//
//  ViewController.swift
//  CitiAnimationTest
//
//  Created by Luis Arias on 3/24/18.
//  Copyright © 2018 Luis Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  let transition = PopAnimator()
  var selectedCellFrame: CellTable!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! CellTable
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedCellFrame = tableView.cellForRow(at: indexPath) as! CellTable
    let newVC = DetailViewController()
    newVC.transitioningDelegate = self
    present(newVC, animated: true, completion: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
}

extension ViewController: UIViewControllerTransitioningDelegate {
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    transition.presenting = true
    let x = selectedCellFrame.frame.minX
    let y = selectedCellFrame.frame.minY
    let width = selectedCellFrame.frame.width
    let height = selectedCellFrame.frame.height
    let cell = UIView(frame: CGRect(origin: CGPoint(x: x + 16, y: y + 40), size: CGSize(width: width, height: height)))
    cell.backgroundColor = .red
    transition.cellView = cell
    transition.image = selectedCellFrame?.cardImage
    return transition
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return nil
  }
}

class CellTable: UITableViewCell {
  
  @IBOutlet var cardImage: UIImageView!
  @IBOutlet var amountLabel: UILabel!
  
  
}

