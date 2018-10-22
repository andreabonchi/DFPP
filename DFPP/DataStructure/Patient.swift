//
//  Patient.swift
//  DFPP
//
//  Created by AND on 19/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import Foundation

class Patient: NSObject {
    
    var name: String
    var surname : String
    
    var histForm : Form?
    var visitList: [Form] = []
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        
//        self.histForm = Form(name: self.surname)
//        self.histForm.fillDefHistValues()
    }
    
    
    
}
