//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by phuongzzz on 10/3/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundReview: UIImageView!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundReview.addSubview(blurEffectView)
        
//        containerView.transform = CGAffineTransform(scaleX: 0, y: 0)
        let slideTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let combineTransform = slideTransform.concatenating(scaleTransform)
        containerView.transform = combineTransform
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                        self.containerView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
