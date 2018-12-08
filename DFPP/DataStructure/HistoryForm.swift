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
     Ritona vero se il paziente è ha più di 60 anni
     */
    func isOlderThan60() -> Bool {
        let sec = self.sections.first!
        
        let resp = sec.questions[6].responce
        
        return resp
        
    }
    
    
    /**
     Torna una stringa con il tipo di diabete
     */
    func getDiabeteType() -> String {
        let sec = self.sections.first!
        
        if sec.questions[0].responce { return "tipo 1" }
        if sec.questions[1].responce { return "tipo 2" }
        
        return "Errore"
    }
    
    /**
     Torna vero se è un uomo, falso se una donna
     */
    func isMale() -> Bool {
        let sec = self.sections.first!
        
        return !sec.questions[7].responce
    }
    
}
