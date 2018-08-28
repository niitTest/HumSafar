//
//  FindRoutesViewController.swift
//  NIITMobilityHackathon
//
//  Created by Rahul on 23/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import GooglePlaces



class FindRoutesViewController: UIViewController, UITextFieldDelegate,GMSAutocompleteViewControllerDelegate,UITableViewDelegate,UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource
{
    
    
    
    @IBOutlet weak var filtersView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var modesView: UIView!
    
    var routes = [[String]]()
    var totalPrice = [String]()
    var totalTime = [String]()
    var pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    var isSourceFieldActive :Bool  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceTextField.delegate = self
        destinationTextField.delegate = self
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        isSourceFieldActive = false
        tableView.delaysContentTouches = false
        modesView.isHidden = true
        filtersView.isHidden = true
        self.activityIndicator.isHidden = true
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationItem.title="Journey Planner"
        self.navigationController?.navigationBar.tintColor = UIColor .orange

    }
    
    func loadRoutesView()
    {
        routes = [["cycle","metro","bus","cycle"],["cab","bus","metro","cycle"],["bus","cycle","cab","cycle"],["cycle","cab","cycle","bus"],["metro","cab","bus","bus"],["bus","cycle","cycle","bus"]]
        totalPrice = ["78", "334","223","150","178","50"]
        totalTime = ["78 mins","68 mins","52 mins","65 mins","78 mins","98 mins"]
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("text")
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        if textField == sourceTextField {
            isSourceFieldActive = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell")! as! RoutesCellTableViewCell
        var modes = routes[indexPath.row] as [String]

        cell.mode1.image = UIImage.init(named: modes[0])
        cell.mode2.image = UIImage.init(named: modes[1])
        cell.mode3.image = UIImage.init(named: modes[2])
        cell.mode4.image = UIImage.init(named: modes[3])
        cell.totalFare.text = totalPrice[indexPath.row] as String
        cell.totalTime.text = totalTime[indexPath.row] as String
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        [tableView .deselectRow(at: indexPath, animated: false)]
        let viewController:RouteDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "routesViewController") as! RouteDetailsViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    

    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(String(describing: place.formattedAddress))")
        print("Place attributions: \(place.attributions)")
        dismiss(animated: true, completion: nil)
        self.tableView.isHidden = true
        
        if(isSourceFieldActive == true) {
            sourceTextField.text = place.formattedAddress
            isSourceFieldActive = false
        } else {
            destinationTextField.text = place.formattedAddress
            loadRoutesView()
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                // Put your code which should be executed with a delay here
                self.tableView.reloadData()
                self.tableView.isHidden = false
                self.filtersView.isHidden = false
                self.activityIndicator.stopAnimating()
                self.modesView.isHidden = false
                
            })
            
        }
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }


}


