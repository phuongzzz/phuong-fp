//
//  AddRestaurantViewController.swift
//  FoodPin
//
//  Created by phuongzzz on 10/5/18.
//  Copyright © 2018 phuongzzz. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    @IBAction func toggleBeenHereBtn(sender: UIButton) {
        let accentColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 0.85)
        if sender == yesBtn {
            yesBtn.backgroundColor = accentColor
            yesBtn.setTitleColor(UIColor.white, for: .normal)
            
            noBtn.backgroundColor = UIColor.white
            noBtn.setTitleColor(accentColor, for: .normal)
        } else if sender == noBtn {
            yesBtn.backgroundColor = UIColor.white
            yesBtn.setTitleColor(accentColor, for: .normal)
            
            noBtn.backgroundColor = accentColor
            noBtn.setTitleColor(UIColor.white, for: .normal)
        }
    }

    @IBAction func saveBtnTapped() {
        let nameValue = nameField.text
        let typeValue = typeField.text
        let locationValue = locationField.text
        
        if nameValue != "" && typeValue != "" && locationValue != "" {
            showAlertMessage("Thanks for your contribution!")
            let result = """
            Name: \(String(describing: nameValue))
            Type: \(String(describing: typeValue))
            Location: \(String(describing: locationValue))
            """
            print(result)
        }
        else {
            showAlertMessage("We can not proceed because one of the required fields is blank")
        }
    }
    
    func showAlertMessage(_ message: String) {
        let validationAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        validationAlert.addAction(cancelAction)
        present(validationAlert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView() // clear empty extra rows
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                present(imagePicker, animated: true)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = image
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true

        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }

}
