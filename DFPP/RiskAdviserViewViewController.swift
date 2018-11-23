//
//  RiskAdviserViewViewController.swift
//  DFPP
//
//  Created by AND on 10/11/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import UIKit

class RiskAdviserViewViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var isHighRisk : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillPage()
        
    }
    
    /**
     Riempie la pagina con il contenuto a seconda che sia alto o basso il rischio
     */
    func fillPage() {
        
        if isHighRisk {
            self.textView.text = "il rischio è alto"
        } else {
            self.textView.text = "il rischio è basso"
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
