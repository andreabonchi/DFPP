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
    var date : Date
    lazy var stringDate : String = self.getFormattedDate()
    
    var sections : [Section]
    
    var isModificable : Bool = true
    
    
    init(name: String, sections: [Section] = [], date : Date) {
        
        self.name = name
        self.sections = sections
        self.date = date
    
    }
    
    /**
     Metodo per aggiungere una sezione di default (ossia con tutte le question a false
     */
    func addSection(name: String, questArray : [QuestionContent]) -> Section {
        
        var questions : [Question] = []
        
        for line in questArray {
            let quest = Question(text: line.text, responce: false, value: line.values)
            questions.append(quest)
        }
        
        let section = Section(title: name, questions: questions)
        
        return section
    }
    
    /**
     Metodo per riempire con i valori di default
     */
    func fillDefaultValues() {
     
        print("questo è il metodo di default da sovrascrivere in ogni classe ereditata ")
        
    }
    
    /**
    Torna la striga della data formatatta
    */
    func getFormattedDate() -> String {
        
        let string = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
        
        return string
    }
    
    
    
    
}
