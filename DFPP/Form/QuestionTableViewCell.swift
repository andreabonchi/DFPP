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
    var delegate: QuestionCellDelegate?
    var indexPath: IndexPath?
    
    var myQuestion : Question?
    {
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
    
    func setCell(question: Question, index: IndexPath, delegate: QuestionCellDelegate, isEnabled : Bool = true) {

        self.myQuestion = question
        self.indexPath = index
        
        self.delegate = delegate
        
        self.butSwitch.isEnabled = isEnabled


    }
    
    
    /**
     Imposta la grafica della cella sex
     */
    func setSexCell() {
        let pink = UIColor.init(red: 255/255, green: 105/255, blue: 180/255, alpha: 1)
        let deepskyblue = UIColor(red: 0, green: 192/255, blue: 255/255, alpha: 1)
        self.butSwitch.backgroundColor = deepskyblue.withAlphaComponent(0.9)
        self.butSwitch.tintColor = UIColor.clear
        self.butSwitch.layer.cornerRadius = self.butSwitch.bounds.height / 2
//        self.butSwitch.tintColor = UIColor.blue
        self.butSwitch.onTintColor = pink
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func swichButChange() {
        self.delegate?.changeResponce(result: butSwitch.isOn, index: self.indexPath!)
        
    }

}


protocol QuestionCellDelegate {
    
    func changeResponce(result: Bool, index: IndexPath)
}
