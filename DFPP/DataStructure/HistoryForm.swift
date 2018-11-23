//
//  HistoryForm.swift
//  DFPP
//
//  Created by AND on 18/11/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import Foundation


class HistoryForm : Form {
    
    override init(name: String = "History", sections: [Section], date: Date) {
        super.init(name: name, date: date)
        self.sections = sections
        
    }
    
    /**
     Metodo per riempire con in valori di default la Storia Clinica
     */
    override func fillDefaultValues() {
    
        self.sections.append(self.addSection(name: "Storia Clinica", questArray: dict_quest_hist))
    }
    
    
    /**
     Metodo che ritona l'età
     */
    func getAge(){
        
        
    }
    
    // TODO: metodo per il diabete
    // TODO: metodo per sesso 
}
