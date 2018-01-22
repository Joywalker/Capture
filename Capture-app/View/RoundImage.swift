//
//  RoundImage.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor=UIColor(red: 60, green: 90, blue: 120, alpha: 1).cgColor
        layer.shadowOpacity=0.8
        layer.shadowRadius=5.0
        layer.shadowOffset=CGSize(width:1.0,height:1.0)
        layer.cornerRadius=2.0
    }
    override func draw(_ rect:CGRect){
        super.draw(rect)
        layer.cornerRadius=self.frame.width/2
    }

}
