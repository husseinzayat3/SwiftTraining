//
//  Contact.swift
//  IosTutorial
//
//  Created by Developer Iakta on 04/05/2020.
//  Copyright © 2020 Developer Iakta. All rights reserved.
//

import Foundation

class Contact{
    var name: String = ""
    var surname: String = ""
    var number: String = ""
    var id: Int = 0
    
    init(id: Int, name:String, surname:String, number:String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.number = number
    }
    
}
