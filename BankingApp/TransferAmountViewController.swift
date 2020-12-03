//
//  TransferAmountViewController.swift
//  BankingApp
//
//  Created by Adarshdeep Singh on 03/12/20.
//

import UIKit

class TransferAmountViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return accounts.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(accounts[row].accountNo)
    }
    
    var accounts: [BankAccounts] = [];
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accounts = BankAccounts.findAccountsByUsername(name: AccountLogin.currentUser!);
        accountNumbers.dataSource = self
        accountNumbers.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var amount: UITextField!
    
    @IBOutlet weak var destAccount: UITextField!
 
    
    @IBOutlet weak var accountNumbers: UIPickerView!
    
    
    @IBAction func transferMoney(_ sender: Any) {
        
        let toAccount = Int(destAccount.text ?? "0")!
        let amountTo = Double(amount.text ?? "0")!;
        let fromAccount = (accounts[accountNumbers.selectedRow(inComponent: 0)]).accountNo;
        print(fromAccount, "fromAcc");
        let msg = BankAccounts.transferAmount(accNum1: fromAccount, accNum2: toAccount, amount: amountTo)
        AlertManager.showAlert(title: "TransferAmount", msg: msg, sender: self);
        
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
