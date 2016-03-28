//
//  LoginViewController.swift
//  FirebaseLogin
//
//  Created by Cato Skalstad on 28.03.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.stopAnimating()
        activityIndicator.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        
        activityIndicator.startAnimating()
        activityIndicator.hidden = false
        
         let myRootRef = Firebase(url:"https://testingfirebaseloginexample.firebaseio.com")
        
         let email = emailTextField.text!
         let password = passwordTextField.text!
        
        myRootRef.authUser(email, password: password, withCompletionBlock: {
            error,authData in
            
            if error != nil
            {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                print(error)
                
            }
            else
            {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                
                let viewController:UITabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Main") as! UITabBarController
                
                self.presentViewController(viewController, animated: true, completion: nil)
                
            }
            
        })
        
        
    }
    
    
}
