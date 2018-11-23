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
    
    var histForm : HistoryForm?
    var visitList: [VisitForm] = []
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        

    }
    
    
    
}
