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
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lastVisitLabel: UILabel!
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
    func setCellHistory(histForm: HistoryForm) {
        
        
    }
    
}
