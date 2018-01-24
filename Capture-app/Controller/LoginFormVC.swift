//
//  ViewController.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/21/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit
import Firebase

class LoginFormVC: UIViewController {

    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var registerButton : UIButton!
    @IBOutlet weak var emailText:UITextField!
    @IBOutlet weak var passwordText:UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let email = emailText.text
        let password=passwordText.text
        
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email!, password: password!, completion: { (user, error) in
                if let u = user
                {
                    
                    self.performSegue(withIdentifier: "loginSucces", sender: nil)
                }
            })
        } else {
            return 
        }
        
    }
    @IBAction func registerHere(_ sender: Any) {
        performSegue(withIdentifier: "registerVC", sender: title )
    }
}

