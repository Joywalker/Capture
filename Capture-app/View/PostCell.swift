//
//  PostCell.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit
import FirebaseStorage

class PostCell: UITableViewCell {

    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likes: UILabel!
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(post: Post, image: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likes.text = "\(post.likes)"
        
        if image != nil {
             self.postImg.image = image
        } else
        {
            let ref = Storage.storage().reference(forURL: post.imageUrl)
            ref.getData(maxSize: 2*1024*1024, completion: {(data,error) in
                if error != nil {
                    print("Log: Unable to download")
                } else {
                    print("Log: Download OK")
                    if let imgData = data {
                        if let imageFromData = UIImage(data: imgData) {
                            self.postImg.image = imageFromData
                            FeedVC.imageCache.setObject(imageFromData, forKey: post.imageUrl as NSString)
                        }
                    }
                }
                })
            }
    }
}
