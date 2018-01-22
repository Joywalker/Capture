//
//  DataService.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService{
    static let ds = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_POST = DB_BASE.child("Posts")
    private var _REF_USER = DB_BASE.child("Users")
    
    var REF_BASE: DatabaseReference{
        return _REF_BASE
    }
    
    var REF_POST: DatabaseReference{
        return _REF_POST
    }
    
    var REF_USER: DatabaseReference{
        return _REF_USER
    }
    
    
    func createFirebaseDBUser(Username : String, userCredentials: Dictionary<String,String> )
    {
        
    }
}
