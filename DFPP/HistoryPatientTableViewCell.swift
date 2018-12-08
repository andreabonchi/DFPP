//
//  HistoryPatientTableViewCell.swift
//  DFPP
//
//  Created by AND on 22/11/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import UIKit

class HistoryPatientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var diabeteLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lastVisitLabel: UILabel!
    @IBOutlet weak var lastVisitDateLabel: UILabel!
    @IBOutlet weak var lastVisitImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    /**
     Metodo per impostare il contenuto della cella history
     */
    func setCellHistory(histForm: HistoryForm, lastVisit: VisitForm?) {
        
        //sesso
        if histForm.isMale() {
            self.sexLabel.text = "Uomo"
            self.sexLabel.textColor = maleColor
        } else {
            self.sexLabel.text = "Donna"
            self.sexLabel.textColor = femaleColor
        }
        
        // età
        if histForm.isOlderThan60() {
            self.ageLabel.text = " > 60 anni"
        } else {
            self.ageLabel.text = " < 60 anni"
        }
        
        // tipo di diabete
        let diabeteType = "Diabete " + histForm.getDiabeteType()
        diabeteLabel.text = diabeteType
        
        // ultima visita
        
        self.lastVisitLabel.text = "Ultima visita:"
        
        if lastVisit != nil {
            self.lastVisitDateLabel.text = lastVisit?.getFormattedDate()
            self.lastVisitImage.image = lastVisit?.resultImage
        } else {
            self.lastVisitDateLabel.text = "nessuna visita"
        }
        
    }
    
}
