//
//  FeedVC.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_POST.observe(.value, with: {(snapshot) in
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot]
            {
                for snap in snapshots {
                    print("SNAP \(snap)")
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
          cell.configureCell(post: post)
          return cell
        } else{
            PostCell()
        }
        return PostCell()
    }
    
    
    
    
    @IBAction func signOutPressed(_ sender: Any)
    {
        try! Auth.auth().signOut()
    }
    

}
