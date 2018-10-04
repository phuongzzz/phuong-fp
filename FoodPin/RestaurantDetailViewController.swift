//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by phuongzzz on 10/1/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func close(segue: UIStoryboardSegue) { }

    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            restaurant?.isVisited = true
            
            switch rating {
            case "great":
                restaurant?.rating = "Yes I love it!"
            case "good":
                restaurant?.rating = "Somehow good"
            case "dislike":
                restaurant?.rating = "I do not like this"
            default:
                break
            }
        }
        tableView.reloadData()
        
    }
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let restaurant = self.restaurant {
            restaurantImageView.image = UIImage(named: restaurant.image)
        }
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)

        navigationItem.title = self.restaurant?.name
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableView.automaticDimension
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMap))
        mapView.addGestureRecognizer(tapGestureRecognizer)
        
        
        // CREATE GEOCODER OBJECT (TO FIND THE TEXTUAL LOCATION
        let geoCoder = CLGeocoder()
        
        // PARSE THE ADDRESS STRING
        geoCoder.geocodeAddressString(restaurant?.location ?? "viet nam", completionHandler: {
            (placemarks, error) in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // GET THE FIRST PLACEMARK
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // SET THE ZOOM LEVEL
//                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: true)
                }
            }
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    @objc func showMap() {
        performSegue(withIdentifier: "showMap", sender: self)
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
            cell.valueLabel.text = self.restaurant?.isVisited ?? true ? "yes, \(self.restaurant?.rating ?? "OK")" : "no"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = self.restaurant
        }
    }
}
