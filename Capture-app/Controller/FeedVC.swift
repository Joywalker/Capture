//
//  FeedVC.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var addImage: CircleView!
    var posts = [Post]()
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var postField: UITextField!
    var imageSelected = false
    
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        
        DataService.ds.REF_POST.observe(.value, with: {(snapshot) in
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot]
            {
                for snap in snapshots {
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key,data: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            if let img = FeedVC.imageCache.object(forKey: post.imageUrl as NSString){
                cell.configureCell(post: post, image: img)
                return cell
        } else{
                cell.configureCell(post: post, image: nil)
                return cell
            }
            
        } else {
            return PostCell()
        }
}
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let  image = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            addImage.image = image
            imageSelected = true
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageLogoTouched(_ sender: Any) {
        present(imagePicker,animated: true, completion: nil)
    }
    
    @IBAction func signOutPressed(_ sender: Any)
    {
        try! Auth.auth().signOut()
    }
    
    
    @IBAction func postButtonPressed(_ sender: Any) {
        guard let caption = postField.text, caption != "" else {
            print("Log: Caption must be entered")
            return
        }
        
        guard let image = addImage.image, imageSelected == true  else {
            print("No image added")
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(image,0.2) {
            let imgUID = NSUUID().uuidString
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            DataService.ds.REF_POST_IMAGES.child(imgUID).putData(imgData, metadata: metadata) { (metadata, error) in
                if error != nil {
                print("Log: Unable to upload image to firebase")
            } else {
                    print("Log: Successfully uploaded")
                    let downloadURL = metadata?.downloadURL()?.absoluteString
                    if let url = downloadURL {
                         self.postToFirebase(imgUrl: url)
                    }
                   
            }
        }
    }
    }
    
    func postToFirebase(imgUrl: String){
        let post: Dictionary<String, AnyObject> = [
            "caption" : postField.text! as AnyObject,
            "imageUrl" : imgUrl as AnyObject,
            "likes": 0 as AnyObject
        ]
        
        let firebase = DataService.ds.REF_POST.childByAutoId()
        firebase.setValue(post)
        postField.text=""
        imageSelected = false
        addImage.image = UIImage(named: "images")
    }
    

}
