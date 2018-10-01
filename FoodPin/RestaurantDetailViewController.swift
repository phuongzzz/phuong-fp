//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by phuongzzz on 10/1/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurantImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurantImage)
    }
}
