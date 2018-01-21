//
//  ViewController.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/21/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit

class LoginFormVC: UIViewController {

    var loginButton : UIButton!
    var registerButton : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func registerHere(_ sender: Any) {
        performSegue(withIdentifier: "registerVC", sender: title )
    }
}

