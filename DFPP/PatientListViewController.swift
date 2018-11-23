//
//  PatientListViewController.swift
//  DFPP
//
//  Created by AND on 19/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import UIKit

class PatientListViewController: UITableViewController {
    
    let appD = UIApplication.shared.delegate as! AppDelegate
    
    static let segueShowPatient = "showPatient"
    
    @IBOutlet weak var addPatientButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.appD.patientList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "patientCell", for: indexPath)

        // Configure the cell...
        
        let patient = self.appD.patientList[indexPath.row]
        
        let nameSurname = patient.name + " " + patient.surname
        cell.textLabel?.text = nameSurname
        
        if patient.visitList.isEmpty {
            cell.detailTextLabel?.text = "Nessuna visita"
        } else {
            let visit = patient.visitList.last
            cell.detailTextLabel?.text = visit?.stringDate
            
        }
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selezionata cella ")
        
        let patient = self.appD.patientList[indexPath.row]
        self.performSegue(withIdentifier: PatientListViewController.segueShowPatient, sender: patient)
        
        
    }
    
    
    // MARK: - Risposta al bottone per aggiungere un paziente
 
    @IBAction func clickAddPatient(_ sender: Any) {
        
        self.showAddPatientAlert()
        
    }
    
    /**
     Mostra l'alert per aggiungere un paziente
     */
    func showAddPatientAlert() {
        
        let alertController = UIAlertController(title: "Aggiungi un nuovo paziente", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Cognome"
        }
        let saveAction = UIAlertAction(title: "Salva", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            self.addPatient(name: firstTextField.text, surname: secondTextField.text)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Nome"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    fileprivate func addPatient(name: String?, surname: String?) {
        guard name != nil && surname != nil else {
            print("nome o cognome assenti")
            return
        }
        let patient = Patient(name: name!, surname: surname!)
        self.appD.patientList.append(patient)
        
        self.tableView.reloadData()
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == PatientListViewController.segueShowPatient {
            
            let patient = sender as? Patient
            
            let patientView = segue.destination as! AnagraficaTableViewController
            self.appD.currentPatient = patient
            patientView.patient = patient
        }
    }


}
