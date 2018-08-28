//
//  PaymentViewController.swift
//  NIITMobilityHackathon
//
//  Created by Rahul on 27/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor .orange
        self.navigationItem.title="Payment Details"

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doPayment(_ sender: Any) {
        let alert = UIAlertController(title: "Payment Confirmation", message: "Please confirm that your journey amount will be deducted from UPI account", preferredStyle: .alert)

        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
           self.navigate()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
            
           self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true)
    }
    
    
    func navigate()
    {
        let alert = UIAlertController(title: "Payment Successful", message: "Payment completed successfully. Would you like to start your journey", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
            let viewController:QRScannerController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QRScannerViewController") as! QRScannerController
            // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
            
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true)
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
