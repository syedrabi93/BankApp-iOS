//
//  PayutilsViewController.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 30/11/20.
//

import UIKit





class PayutilsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let utilities = ["Mobile Recharge","Electricity Bill", "Wifi Bill", "Insurance", "Gas Bill"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0){
            return accounts.count;
        }
        return utilities.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         if(pickerView.tag == 0){
            return String(accounts[row].accountNo);
               }
               return utilities[row]
    }
    
 
    var accounts: [BankAccounts] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        // fill accounts with current users account list
        accounts = BankAccounts.findAccountsByUsername(name: AccountLogin.currentUser!);
               accountNumbers.dataSource = self
               accountNumbers.delegate = self
      
        utilitiesPicker.dataSource = self
        utilitiesPicker.delegate = self;
        
        // Do any additional setup after loading the view.
    }
    
    
    // payutility function to handle payment of utilities
    @IBAction func payUtility(_ sender: Any) {
        
        let accountNum = accounts[accountNumbers.selectedRow(inComponent: 0)].accountNo;
        var amountVal: Double = 0;
        if amount.text == ""{
            return AlertManager.showAlert(title: "Pay Utilities", msg: "Amount is empty", sender: self)
        }
        else{
        do {
            amountVal = try Helpers.readDouble(field: amount)
        }catch {
            return AlertManager.showAlert(title: "Pay Utilities", msg: "Invalid Amount Entered", sender: self)
        }
        
        
        let utilityName = utilities[utilitiesPicker.selectedRow(inComponent: 0)];
        let msg = BankAccounts.payUtility(acc: accountNum, util: utilityName, amount: amountVal)
        
            AlertManager.showAlert(title: "Pay Utilities", msg: msg, sender: self)}
        
    }
    

    @IBOutlet weak var accountNumbers: UIPickerView!
    @IBOutlet weak var utilitiesPicker: UIPickerView!
    @IBOutlet weak var amount: UITextField!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
