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
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            if(user != nil)
            {
                print("Inregistrat cu succes")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
