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
    @IBAction func registerButtonPressed(_ sender: Any) {
            let username = usernameText.text!
            let email = emailText.text!
            let password = passwordText.text!
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, err) in
                
                if err != nil {
                    
                        if username=="", password=="",email==""
                        {
                    var alert = UIAlertController(title: "Registration", message: "Please enter valid information.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.show(self, sender: nil)
                    }
                    
                } else {
                    
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

