//
//  MainViewController.swift
//  FirebaseLogin
//
//  Created by Cato Skalstad on 28.03.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let myRootRef = Firebase(url:"https://testingfirebaseloginexample.firebaseio.com")
        
        if myRootRef.authData != nil
        {
            //User authenticaded
        }
        else
        {
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
            
            self.presentViewController(viewController, animated: true, completion: nil)
        }
        
    }
}
