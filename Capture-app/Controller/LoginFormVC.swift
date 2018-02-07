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
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let email = emailText.text!
        let password=passwordText.text!
        print(email.count)
        print(password.count)
        if email.count != 0 && password.count != 0 {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil && user != nil
                    {
                        self.performSegue(withIdentifier: "loginSucces", sender: nil)
                        
                    } else{
                        self.alert(message: "This user doesn't exist", title: "Login")
                        self.emailText.text=""
                        self.passwordText.text=""
                }
            })} else
                    {
                        self.alert(message: "Try again", title: "Login")
                        emailText.text=""
                        passwordText.text=""
                    }
    }
    @IBAction func registerHere(_ sender: Any) {
        self.performSegue(withIdentifier: "registerVC", sender: title )
    }
}

