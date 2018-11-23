//
//  FormTableViewController.swift
//  DFPP
//
//  Created by AND on 17/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController, QuestionCellDelegate {
    
    let appD = UIApplication.shared.delegate as! AppDelegate
    var myForm : Form?
    

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    let segueRiskView = "segueShowRisk"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.buildBaseData()
        
    }
    
    private func buildBaseData() {

        self.title = "Visita " + myForm!.stringDate
        
        if self.myForm is VisitForm && !self.myForm!.isModificable {
            
            let visForm = self.myForm as! VisitForm
            self.doneBarButton.title = ""
            
            if visForm.isHighRiskResult! {
                self.doneBarButton.image = highRiskImage
            } else {
                self.doneBarButton.image = lowRiskImage
            }

        } else {
            self.doneBarButton.title = "Done"
        }

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return myForm!.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sect = self.myForm!.sections[section]
    
        return sect.questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        
        let sec = self.myForm!.sections[indexPath.section]
        let question = sec.questions[indexPath.row]
        
        cell.setCell(question: question, index: indexPath, delegate: self, isEnabled: myForm!.isModificable)
        
        
        if myForm is HistoryForm && indexPath.row == 7 {
    
            cell.setSexCell()
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sec = self.myForm!.sections[section]
        return sec.title
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
    // MARK: - click button responce
//    @IBAction func clickCancel(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
//
//        dismiss(animated: true, completion: nil)
//
//    }
    
    
    @IBAction func clickDone(_ sender: Any) {
        
        // in case of visit form
        if let visForm = self.myForm as? VisitForm  {
            
            if visForm.isModificable {
                let result = visForm.calculateResult()
                
                // salviamo la visita corrente
                if self.appD.currentPatient != nil {
                    self.appD.currentPatient!.visitList.append(visForm)
                }
                
                self.buildBaseData()
                self.tableView.reloadData()
                self.showResponceAlert(highRisk: result)

            } else {
                
                self.showVisitSuggestionPage(highRisk: visForm.isHighRiskResult!)
                
            }
        }
        
        
        // in case of history form
        if let histForm = self.myForm as? HistoryForm {
            
            histForm.isModificable = false
            
            if self.appD.currentPatient != nil {
                self.appD.currentPatient!.histForm = histForm
            }
            
            self.buildBaseData()
            self.tableView.reloadData()
            
        }

    }
    
    /**
     Mostra l'alert con il risultato della visita
     */
    func showResponceAlert(highRisk: Bool) {
        
        let title = "Risultato"
        var message = ""
        
        if highRisk {
            message = "Il paziente ha un ALTO livello di rischio. "
        } else {
            message = "Il paziente ha un BASSO livello di rischio. "
        }
        
        message += "Vuoi visualizzare i consigli?"
        
        let okAction = UIAlertAction(title: "No", style: .cancel) {
            (_) -> Void in
            
            self.goBackToView()
            
        }
        let showAction = UIAlertAction(title: "Mostra", style: .default) {
            (_) -> Void in
            self.showVisitSuggestionPage(highRisk: highRisk)
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(okAction)
        alert.addAction(showAction)
        
        self.present(alert, animated: true)
        
    }
    
    /**
     Mostra la pagina con i suggerimenti
     */
    func showVisitSuggestionPage(highRisk: Bool) {
        debugPrint("andiamo alla pagina dei consigli")
        self.performSegue(withIdentifier: self.segueRiskView, sender: highRisk)
        
    }
    
    /**
    Torna indietro alla view precendete
    */
    func goBackToView() {
        //TODO: add back view???? altrimenti nulla
    }

    
    // MARK: - Question Delegate (delegati delle azioni nelle singole celle)
    
    func changeResponce(result: Bool, index: IndexPath) {
        
        self.myForm!.sections[index.section].questions[index.row].responce = result
        
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.segueRiskView {
            let res = sender as! Bool
            
            let riskView = segue.destination as! RiskAdviserViewViewController
            riskView.isHighRisk = res
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
