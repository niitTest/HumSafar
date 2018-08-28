//
//  RouteDetailsViewController.swift
//  NIITMobilityHackathon
//
//  Created by Rahul on 24/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class RouteDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tripCostView: UIView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var routesTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "routescell")! as! UITableViewCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        routesTableView.isHidden = true
        tripCostView.isHidden = true
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title="Route Details"

        confirmBtn.isHidden = true
        self.navigationController?.navigationBar.tintColor = UIColor .orange

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            // Put your code which should be executed with a delay here
            self.activityIndicator.stopAnimating()
            self.routesTableView.isHidden = false
            self.confirmBtn.isHidden = false
            self.tripCostView.isHidden = false

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
