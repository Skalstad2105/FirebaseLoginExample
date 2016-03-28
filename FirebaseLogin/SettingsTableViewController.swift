//
//  SettingsTableViewController.swift
//  FirebaseLogin
//
//  Created by Cato Skalstad on 28.03.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit
import Firebase

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func logOutButtonPressed(sender: AnyObject) {
        
        
        let alert2 = UIAlertController(title:"Are your sure?", message: "Would you really log out?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Destructive)
        {
            (ACTION: UIAlertAction) -> Void in
            
            
            let myRootRef = Firebase(url:"https://testingfirebaseloginexample.firebaseio.com")
            
            myRootRef.unauth()
            
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(viewController, animated: true, completion: nil)
        
        }
        let cancelAction = UIAlertAction(title:"No", style: UIAlertActionStyle.Default){
            (ACTION: UIAlertAction) -> Void in
        }
        
        alert2.addAction(saveAction)
        alert2.addAction(cancelAction)
        
        
        
        presentViewController(alert2, animated: true, completion: nil)
        
    }
    

}
