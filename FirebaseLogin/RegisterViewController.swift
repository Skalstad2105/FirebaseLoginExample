//
//  RegisterViewController.swift
//  FirebaseLogin
//
//  Created by Cato Skalstad on 28.03.2016.
//  Copyright © 2016 Marius Skalstad. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
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
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        
        activityIndicator.startAnimating()
        activityIndicator.hidden = false
        
        let myRootRef = Firebase(url:"https://testingfirebaseloginexample.firebaseio.com")
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        myRootRef.createUser(email, password: password, withValueCompletionBlock: {
            error,result in
            
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
                
                let uid = result["uid"] as? String
                print("Sucessfully created user account with uid: \(uid!)")
            }
            
        })
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
