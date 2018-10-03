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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Cafe", location: "A. P. Croll & Son 2299 Lewes-Georgetown Hwy, Georgetown, DE 19947 day la vi du cho mot dia chi rat la dai, rat la dai ban hieu khong? vi the nen hay lam cho no that la dai", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Bakery", location: "11522 Shawnee Road, Greenwood DE 19950", image: "homei.jpg", isVisited: true),
        Restaurant(name: "Teakha", type: "Caferita", location: "144 Kings Highway, S.W. Dover, DE 19901", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe Loisl", type: "Cafe", location: "Intergrated Const. Services 2 Penns Way Suite 405 New Castle, DE 19720", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "Restaurant", location: "Humes Realty 33 Bridle Ridge Court, Lewes, DE 19958", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Restaurant", location: "Nichols Excavation 2742 Pulaski Hwy Newark, DE 19711", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Cafe", location: "2284 Bryn Zion Road, Smyrna, DE 19904", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Bakery", type: "Bakery", location: "VEI Dover Crossroads, LLC 1500 Serpentine Road, Suite 100 Baltimore MD 21", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Chocolate", location: "580 North Dupont Highway Dover, DE 19901", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "Cafe", location: "P.O. Box 778 Dover, DE 19903", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "Drinks", location: "21 Manor Station Street Mchenry, IL 60050", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "Foods", location: "9216 Mayfair Ave. Saint Joseph, MI 49085", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Meats", location: "739 County Rd. Statesville, NC 28625", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Food", location: "81 Branch Rd. Conyers, GA 30012", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Drinks", location: "1 Willow Circle Opa Locka, FL 33054", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Cafe", location: "505 E. Homestead St. Rocky Mount, NC 27804", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Cafe", location: "9265 Surrey Road North Augusta, SC 29841", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Drinks", location: "41 Fairfield St. Madisonville, KY 42431", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Chocolate", location: "5 Boston Lane Hopkinsville, KY 42240", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "Drinks", location: "7 S. Johnson Street Midlothian, VA 23112", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Pub", location: "501 Virginia Ave. Winter Garden, FL 34787", image: "caskpubkitchen.jpg", isVisited: false)
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
                destinationController.restaurant = restaurants[indexPath.row]
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
