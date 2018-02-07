//
//  RegisterVC.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/21/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
            var username = usernameText.text!
            var email = emailText.text!
            var password = passwordText.text!
        
        var passwordOK : Bool = false
        var emailOK : Bool = false
        
        if (password.count < 8 ) {
            alert(message: "Password must be over 8 characters", title: "Password")
            passwordText.text = ""
            
        } else
        {
            passwordOK = true
        }
        if(!email.contains("@") && (email.count < 15))
        {
           self.alert(message: "Enter a valid email address", title: "Email")
           emailText.text = ""
            
        } else
        {
            emailOK = true
        }
        
        if emailOK && passwordOK {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, err) in
                
                if err != nil {
                    self.alert(message: "Please enter valid information", title: "Registration")
                    }
                    else {
                    UserDefaults.standard.setValue(user?.uid, forKey: "uid")
                    Database.database().reference().child("Users").setValue([user!.uid : ["email" : email,"password" : password, "username" : username]])
                    
                    var Alert = UIAlertController(title: "Registration", message: "Registration succesful", preferredStyle: UIAlertControllerStyle.alert)
                    Alert.addAction(UIAlertAction(title: "Login Page", style: UIAlertActionStyle.default, handler:  { action in self.dismiss(animated: true, completion: nil)}))
                    self.present(Alert, animated: true, completion: nil)
                    self.view.endEditing(true)
                }
                })
        }
    }
}

