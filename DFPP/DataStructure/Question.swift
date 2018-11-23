//
//  Question.swift
//  DFPP
//
//  Created by AND on 16/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import Foundation

typealias QuestionValue = (yesValue: Int, noValue: Int)

struct Question {
    
    var text: String
    var responce : Bool
    var value: QuestionValue
    var isCritical : Bool = false
    
    init(text: String, responce: Bool = false, value: QuestionValue = (1, 0)) {
        self.text = text
        self.responce = responce

        self.value = value
        
        if self.value.yesValue > 1 {
            self.isCritical = true
        }
        
    }
    
    /**
     Metodo che torna 1 o 0 a seconda del valore passato (selezionato dal bottone)
     */
    func getResult() -> Int {
        if responce {
            return value.yesValue
        } else {
            return value.noValue
        }
        
    }
    
}











