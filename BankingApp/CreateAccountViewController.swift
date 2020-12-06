//
//  CreateAccountViewController.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 30/11/20.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Generate account number
        let generatedAcc = BankAccounts.generateAccountNum();
        // fill the input with account number
        accnumber.text = "\(generatedAcc)";
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var accnumber: UITextField!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func create(_ sender: Any) {
        
        // on click of create account button
        // get the type of account and create it
        
        let index = segment.selectedSegmentIndex
        let type = segment.titleForSegment(at: index);
        let account = Int(accnumber.text!);
        let msg = BankAccounts.createAccount(type: type!, accNumber: account!);
        AlertManager.showAlert(title: "Create New Account", msg: msg, sender: self)
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
