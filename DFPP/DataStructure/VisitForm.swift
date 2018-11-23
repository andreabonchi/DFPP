//
//  VisitForm.swift
//  DFPP
//
//  Created by AND on 18/11/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import Foundation

class VisitForm : Form {
    
    var visitResultInt : Int?
    var isHighRiskResult : Bool?
    
    override init(name: String, sections: [Section], date: Date) {
        super.init(name: name, date: date)
        self.sections = sections
    
    }
    
    /**
     Metodo per riempire con in valori di default la Visita
     */
    override func fillDefaultValues() {
        
        self.sections.append(self.addSection(name: "Status della cute", questArray: dict_quest_cute))
        self.sections.append(self.addSection(name: "Status delle unghie", questArray: dict_quest_unghie))
        self.sections.append(self.addSection(name: "Identificazione delle deformità", questArray: dict_quest_def))
        self.sections.append(self.addSection(name: "Reazione alla Temperatura", questArray: dict_quest_temp))
        self.sections.append(self.addSection(name: "Valutazione della sensibilità", questArray: dict_quest_sens))
        self.sections.append(self.addSection(name: "Autovalutazione", questArray: dict_quest_auto))
    }
    
    
    
    /**
     Calcola il risultato del form e ritorna il valore di isHighRiskResult
     */
    func calculateResult() -> Bool {
        
        var visitResult : Int = 0
        for section in self.sections {
            for question in section.questions {
                visitResult += question.getResult()
            }
        }
        
        self.visitResultInt = visitResult
        
        if visitResult < 19 {
            self.isHighRiskResult = false
        } else {
            self.isHighRiskResult = true
        }
        
        self.isModificable = false
        
        return self.isHighRiskResult!
    }
    

    
}
