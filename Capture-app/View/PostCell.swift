//
//  PostCell.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

   

}
