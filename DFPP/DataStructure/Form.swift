//
//  Form.swift
//  DFPP
//
//  Created by AND on 16/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import Foundation

class Form {
    let name : String
    var sections : [Section]
    
    init(name: String, sections: [Section] = []) {
        self.name = name
        self.sections = sections
        
    }
    
    /**
     Metodo per aggiungere una sezione di default (ossia con tutte le question a false
     */
    func addSection(name: String, questArray : [String]) -> Section {
        
        var questions : [Question] = []
        
        for line in questArray {
            let quest = Question(text: line)
            questions.append(quest)
        }
        
        let section = Section(title: name, questions: questions)
        
        return section
    }
    
    /**
     Metodo per riempire tutte le sezioni con i valori di default
     */
    func fillDefaultValues() {
    
        self.sections.append(self.addSection(name: "Storia Clinica", questArray: quest_hist))
        self.sections.append(self.addSection(name: "Status della cute", questArray: quest_cute))
        self.sections.append(self.addSection(name: "Status delle unghie", questArray: quest_unghie))
        self.sections.append(self.addSection(name: "Identificazione delle deformità", questArray: quest_def))
        self.sections.append(self.addSection(name: "Reazione alla Temperatura", questArray: quest_temp))
        self.sections.append(self.addSection(name: "Valutazione della sensibilità", questArray: quest_sens))
        self.sections.append(self.addSection(name: "Autovalutazione", questArray: quest_auto))
        
        
    }
    
    
    
}
