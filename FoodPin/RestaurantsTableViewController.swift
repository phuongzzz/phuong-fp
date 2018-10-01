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
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Ha Noi", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Bakery", location: "Paris", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Caferita", location: "Bankok", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe Loisl", type: "Cafe", location: "Sydney", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "Restaurant", location: "Lodon", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Restaurant", location: "Munchen", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Cafe", location: "Berlin", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Bakery", type: "Bakery", location: "Manchester", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Chocolate", location: "Sofia", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "Cafe", location: "Southamton", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "Drinks", location: "Beijing", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "Foods", location: "Moscow", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Meats", location: "Otawa", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Food", location: "Tokyo", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Drinks", location: "New York", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Cafe", location: "San Diego", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Cafe", location: "Kingston", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Drinks", location: "Milan", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Chocolate", location: "Napoli", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "Drinks", location: "Java", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Pub", location: "Madrid", image: "caskpubkitchen.jpg", isVisited: false)
    ]
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = restaurants[indexPath.row].name
        cell.typeLabel?.text = restaurants[indexPath.row].type
        cell.locationLabel?.text = restaurants[indexPath.row].location
        cell.thumbnailImageView?.image = UIImage(named: restaurants[indexPath.row].image)
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    /*
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
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("before: ", restaurantNames.count)
        if .delete == editingStyle {
            restaurantNames.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
        }
        print("after: ", restaurantNames.count)
        
//        tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
     */
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {
            (action, indexPath) -> Void in
            let defaultText = "Just cheking in at" + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {
            (action, indexPath) -> Void in
                self.restaurants.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173/255.0, blue: 99/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurantImage = restaurants[indexPath.row].image
                destinationController.restaurantName = restaurants[indexPath.row].name
            }
        }
    }

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
