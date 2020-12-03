//
//  UpdatePeronalsViewController.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 30/11/20.
//

import UIKit

class UpdatePeronalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userAcc = BankAccounts.findAccountsByUsername(name: AccountLogin.currentUser!);
        print("View Did load Called")
        name.text = userAcc[0].ClientName;
        contact.text = userAcc[0].Contact;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func update(_ sender: Any) {
        let msg = BankAccounts.updateDetails(name: name.text!, contact: contact.text!)
        AlertManager.showAlert(title: "Update Details", msg: msg, sender: self)
    }
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var contact: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
