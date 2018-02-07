//
//  AlertMessage.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/24/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//
import UIKit
import Foundation

class AlertMessage: UIAlertController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    class func alertMessage(message: String, title: String) -> Void {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
