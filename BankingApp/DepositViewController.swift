//
//  DepositViewController.swift
//  BankingApp
//
//  Created by Adarshdeep Singh on 30/11/20.
//

import UIKit




class DepositViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
    
    @IBOutlet weak var accountNumbers: UIPickerView!
    
    @IBOutlet weak var amount: UITextField!
    
    @IBAction func buttonClick(_ sender: Any) {
          
        var amountVal: Double = 0;
        do {
            amountVal = try Helpers.readDouble(field: amount)
        }catch {
            return AlertManager.showAlert(title: "Deposit Amount", msg: "Invalid Amount Entered", sender: self)
        }
        
        let accNum = accounts[accountNumbers.selectedRow(inComponent: 0)].accountNo;
        let msg = BankAccounts.depositMoney(accNum: accNum, amount: amountVal);
        AlertManager.showAlert(title: "Deposit Amount", msg: msg, sender: self)
        
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
