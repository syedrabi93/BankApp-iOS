//
//  DeleteAccountViewController.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 30/11/20.
//

import UIKit

class DeleteAccountViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return accounts.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(accounts[row].accountNo);
    }
    var accounts: [BankAccounts] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        accounts = BankAccounts.findAccountsByUsername(name: AccountLogin.currentUser!);
               accountNumbers.dataSource = self
               accountNumbers.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var accountNumbers: UIPickerView!
    
    @IBAction func deleteAcc(_ sender: Any) {
        let row = accountNumbers.selectedRow(inComponent: 0);
       let accNum = accounts[row].accountNo;
        let msg = BankAccounts.deleteAccount(accNum: accNum);
         accounts = BankAccounts.findAccountsByUsername(name: AccountLogin.currentUser!);
        accountNumbers.reloadAllComponents()
        AlertManager.showAlert(title: "Delete Account", msg: msg, sender: self)
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
