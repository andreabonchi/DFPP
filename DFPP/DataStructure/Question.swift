//
//  Question.swift
//  DFPP
//
//  Created by AND on 16/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import Foundation


struct Question {
    
    var text: String
    var responce : Bool
    
    init(text: String, responce: Bool = false) {
        self.text = text
        self.responce = responce
    }
    
}


let quest_hist = ["Soffri di  diabete di tipo 1?",
                  "Soffri di diabete di tipo 2?",
                  "Ti hanno diagnosticato il diabete da più di 10 anni?",
                  "Hai mai avuto o hai: amputazione, ulcere o dolore ai tuoi piedi e/o alle gambe?",
                  "Il tuo dottore di hai mai parlato e/o diagnosticato una neuropatia ?",
                  "Hai o hai mai avuto infezioni da funghi ai piedi?",
                  "Hai più di 60 anni?",
                  "SESSO",
                  "Hai un buon controllo glicemico?",
                  "Sei sovrappeso?",
                  "Hai notato gonfiore su piedi e/o gambe?"]


let quest_cute = ["La cute delle gambe e/o dei piedi è secca?",
                  "Hai notato fissurazioni/lesione nella cute di piedi e/o gambe?",
                  "La cute dei tuoi piedi è  sottile e/o lucida?",
                  "Hai callosità?",
                  "I tuoi piedi sudano molto?",
                  "Il colore della tua cute (piedi e/o gambe) presenta una colorazione cianotica (bruno/porpora)?",
                  "Hai ipercheratosi (ispessimento dell'epidermide)?",
                  "Hai notato eritemi su qualche zona dei piedi?"]


let quest_unghie = ["Le unghie sono ben curate ? Presentano danni o infezioni? Sono spesse o scure?"]

let quest_def = ["Hai notato i segni di una distribuzione del peso non corretta?",
                 "Le tue scarpe mostrano un'eccessiva usura della suola o di una zona in particolare rispetto alle altre?"]

let quest_temp = ["Trova difficoltà nel distinguere l'acqua calda da quella fredda?",
                  "Hai i piedi o le gambe fredde?"]

let quest_sens = ["Ti capita di percepire una sensazione di formicolio o intorpidimento (sensazione della gamba che si addormenta) nei piedi o gambe?",
                  "I tuoi piedi o gambe sono ipersensibili al tatto?",
                  "Ti capita di avere crampi muscolari a piedi o gambe?",
                  "Le da fastidio il contatto delle lenzuola sulla pelle?",
                  "Avverte mai una sensazione simile a  punture di spillo nelle gambe e/o piedi?",
                  "Le fanno male le gambe quando cammina?",
                  "Non si accorge dei suoi piedi quando cammina?",
                  "Le fanno male le gambe o i piedi quando cammina o sta a riposo?"]

let quest_auto = ["Vive da solo?",
                  "Controlla quotidianamente i suoi piedi?",
                  "Controlla le calzature prima di indossarle?",
                  "Viene controllato periodicamente da un centro per la cura del piede?",
                  "Utilizza prodotti per la cura ed idratazione del piede?",
                  "Utilizza scarpe per diabetici?",
                  "Utilizza calze per diabetici?",
                  "Segue la terapia consigliata dal suo medico per quanto riguarda il diabete e/o prevenzione del piede diabetico?",
                  "Cammina scalzo?"]








