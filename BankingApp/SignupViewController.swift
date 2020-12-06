//
//  SignupViewController.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 29/11/20.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var custName: UITextField!
    @IBOutlet weak var CustContact: UITextField!
    @IBOutlet weak var AccountType: UISegmentedControl!
    var accountType:String = ""
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func accountType(_ sender: UISegmentedControl) {
        switch AccountType.selectedSegmentIndex {
            
        case 0:
            accountType = "Savings"
        case 1:
            accountType = "Current"
        default :
            accountType = "Savings"
        }
        
    }
    
    // clicking on create account button results in calling of
    // this function it will create user account and save it back to filesystem
    @IBAction func CreateAccount(_ sender: Any) {
        var Alllogins = AccountLogin.readUserAccounts();
        var Allaccounts = BankAccounts.readBankAccounts()
        var status:Bool=false
        
        for user in Allaccounts
        {
            if user.clientID == UserName.text && user.ClientName == custName.text {
                AlertManager.showAlert(title: "Sign Up", msg:"User already Exist.Try login with correct password", sender: self);
                status = true
            }
        }
        if (UserName.text == "" || Password.text == "" || custName.text == "" || CustContact.text == "" )
        {
            print ("check here")
            AlertManager.showAlert(title: "Sign Up", msg:"All fields are mandatory", sender: self);
            status = true
        }
        if  status != true
        {
            Alllogins.append(AccountLogin(username: UserName.text!, password: Password.text!))
            Allaccounts.append(BankAccounts(clientID: UserName.text!, accountType: AccountType.titleForSegment(at: AccountType.selectedSegmentIndex)!, ClientName: custName.text!, Contact: CustContact.text!, accountNo: BankAccounts.generateAccountNum(), currentBalance: 0.0, previousTransaction: 0.0))
            print(Alllogins)
            print(Allaccounts)
            AccountLogin.saveUserAccounts(account: Alllogins)
            BankAccounts.saveAccounts(AllAccounts: Allaccounts)
            AlertManager.showAlert(title: "Sign Up", msg:"Account created successfully. Login to start transactions", sender: self);
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
