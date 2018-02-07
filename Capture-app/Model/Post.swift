//
//  Post.swift
//  Capture-app
//
//  Created by Razvant Alexandru on 1/22/18.
//  Copyright © 2018 Razvant Alexandru. All rights reserved.
//

import Foundation

class Post{
    
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes :Int!
    private var _postKey: String!
    
    
    
    var caption : String{
        return _caption
    }
    
    var imageUrl: String{
        return _imageUrl
    }
    
    var likes: Int{
        return _likes
    }
    
    var postKey: String{
        return _postKey
    }
    
    init(caption: String, imageUrl: String, likes: Int)
    {
        self._caption = caption
        self._imageUrl = imageUrl
        self._likes = likes
    }
    
    init(postKey: String, data: Dictionary<String, AnyObject>)
    {
        self._postKey = postKey
        
        if let caption=data["caption"] as? String {
            self._caption = caption
        }
        
        if let imageURL=data["imageUrl"] as? String {
            self._imageUrl = imageURL
        }
        
        if let likes=data["likes"] as? Int{
            self._likes = likes
        }
    }
}
