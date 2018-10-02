//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by phuongzzz on 10/1/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let restaurant = self.restaurant {
            restaurantImageView.image = UIImage(named: restaurant.image)
        }
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        // REMOVE SEPERATOR FOR EMPTY ROWS
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        navigationItem.title = self.restaurant?.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RestaurantDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = self.restaurant?.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = self.restaurant?.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = self.restaurant?.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = self.restaurant?.isVisited ?? true ? "yes" : "no"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}
