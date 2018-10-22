//
//  QuestionTableViewCell.swift
//  DFPP
//
//  Created by AND on 17/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var butSwitch: UISwitch!
    @IBOutlet weak var textQuestion: UILabel!
    
    var myQuestion : Question? {
        didSet {
            guard let myQuestion = myQuestion else {return}
            
            self.textQuestion.text = myQuestion.text
            self.butSwitch.isOn = myQuestion.responce
            self.butSwitch.addTarget(self, action: #selector(self.swichButChange), for: .valueChanged)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func swichButChange() {
        print("valore cambiato")
        
    }

}
