//
//  Post.swift
//  PhotoShareAppFirebase
//
//  Created by İbrahim Demirci on 4.12.2021.
//

import Foundation

class Post{
    
    var email : String
    var comment : String
    var url : String
    
    init(email : String, comment : String, url : String){
        self.email = email
        self.comment = comment
        self.url = url
        
        
    }
}
