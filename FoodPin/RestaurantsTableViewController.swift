//
//  RestaurantsTableViewController.swift
//  FoodPin
//
//  Created by phuongzzz on 9/29/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster",
                           "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso",
                           "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
                           "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend.jpb", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant",
                            "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg",
                            "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg",
                            "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    var restaurantIsVisited = Array(repeating: false, count: 21)
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // adding option menu as an action sheet:
        let optionMenu = UIAlertController(title: "Select action to perform", message: nil, preferredStyle: .actionSheet)
        
        // adding action to the sheet
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let errorMessage = UIAlertController(title: "Can not make the call", message: "Service unavailable", preferredStyle: .alert)
            let cancelCallAction = UIAlertAction(title: "Cancel Call", style: .cancel, handler: nil)
            errorMessage.addAction(cancelCallAction)
            self.present(errorMessage, animated: true)
        }
        
        let callAction = UIAlertAction(title: "Call the restaurant", style: .default, handler: callActionHandler)
        
        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler:
        {
            (action: UIAlertAction!) -> Void  in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
        
        let uncheckInAction = UIAlertAction(title: "Uncheckin", style: .default, handler:
        {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            self.restaurantIsVisited[indexPath.row] = false
        })
        // add action to the menu
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        restaurantIsVisited[indexPath.row] ? optionMenu.addAction(uncheckInAction) : optionMenu.addAction(checkInAction)
        present(optionMenu, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // First: Create actions
        // Second: Return these actions
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {
            (action, indexPath) -> Void in
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {
            (action, indexPath) -> Void in
            let defaultText = "Share to social"
            // Add more activity items here, can be a image
            if let shareImage = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, shareImage], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // rgb(46, 204, 113)
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        shareAction.backgroundColor = UIColor(red: 46.0/255.0, green: 204.0/255.0, blue: 113.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
