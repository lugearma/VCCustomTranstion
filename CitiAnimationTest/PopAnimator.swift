//
//  Stub.swift
//  CitiAnimationTest
//
//  Created by Luis Arias on 3/24/18.
//  Copyright © 2018 Luis Arias. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  let duration = 1.0
  var presenting = true
  var originFrame = CGRect.zero
  var cellView: UIView?
  var image: UIImageView?
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    toView.addSubview(cellView!)
//    toView.addSubview(image!)
    containerView.addSubview(toView)
    toView.alpha = 1.0
    UIView.animate(withDuration: duration, animations: {
      let x = self.cellView?.frame.minX ?? 0
      let y = self.cellView?.frame.minX ?? 0
      let width = self.cellView?.frame.width ?? 0
      let height = self.cellView?.frame.height ?? 0
      self.cellView?.frame = CGRect(x: 0, y: containerView.frame.height/3, width: containerView.frame.width, height: (containerView.frame.height/3)*2)
      self.cellView?.backgroundColor = .yellow
    }, completion: { _ in
      transitionContext.completeTransition(true)
    })
  }
}
