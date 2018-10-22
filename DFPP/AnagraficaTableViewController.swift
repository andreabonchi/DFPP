//
//  AnagraficaTableViewController.swift
//  DFPP
//
//  Created by AND on 19/10/2018.
//  Copyright © 2018 DFPP. All rights reserved.
//

import UIKit

class AnagraficaTableViewController: UITableViewController {
    
    static let segueShowForm = "showForm"
    
    var name : String = ""
    var surname: String = ""
    
    var patient: Patient? {
        didSet {
            guard let patient = patient else {return}
            self.name = patient.name
            self.surname = patient.surname
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
        
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Anagrafica
        // TODO: verificare se rimuovere la cella
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellAnagrafica", for: indexPath)
            cell.textLabel?.text = self.name
            cell.detailTextLabel?.text = self.surname
            
            return cell
            
        }
        
        // Storia Clinica
        if indexPath.section == 1 {
            
            if patient?.histForm == nil {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellAddForm", for: indexPath)
                
                cell.textLabel?.text = "Aggiungi storia Clinica"
                cell.textLabel?.textColor = UIColor.blue
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellHistory", for: indexPath)
                
                cell.textLabel?.text = patient?.histForm?.name
                
                return cell
            }
        }
        
        
        
        // Visite
        if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellAddForm", for: indexPath)
            
            cell.textLabel?.text = "Aggiungi visita"
            cell.textLabel?.textColor = UIColor.blue
            return cell
        }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAnagrafica", for: indexPath)
        return cell
        

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // sezione form history
        if indexPath.section == 1 {
            var form = patient?.histForm
            
            if form == nil {
                form = Form(name: "History")
                form?.fillDefHistValues()
                print("riempiamo con in default")
            }
            
            self.performSegue(withIdentifier: AnagraficaTableViewController.segueShowForm, sender: form)
        }
        

    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Anagrafica"
        case 1:
            return "Storia Clinica"
        case 2:
            return "Visite"
        default:
            return ""
        }
    }
    
    
    
    @IBAction func unwindFromFormTableView(_ sender: UIStoryboardSegue) {
        
        if let source = sender.source as? FormTableViewController {
            self.patient?.histForm = source.myForm
            print("anagrafica")
            self.tableView.reloadData()
        } else {
            print("errore nell'unwind ")
        }
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
        
        if segue.identifier == AnagraficaTableViewController.segueShowForm {
            
            let form = sender as! Form
            let navSegue = segue.destination as! UINavigationController
            
            if let formViewController = navSegue.topViewController as? FormTableViewController {
                formViewController.myForm = form
            }

            
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
