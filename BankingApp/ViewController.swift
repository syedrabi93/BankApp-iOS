//
//  ViewController.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 26/11/20.
//

import UIKit

class ViewController: UIViewController {

    var AllAccounts: [BankAccounts] = [BankAccounts]();
    var accountLogin: [AccountLogin] = [AccountLogin]();
    
    
    
    
    @IBOutlet weak var loginmessage: UITextField!
    @IBOutlet weak var Uname: UITextField!
    @IBOutlet weak var Pword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {
    }
    
   

    
    @IBAction func login(_ sender: Any) {
        let username = Uname.text
        let password = Pword.text
        let userAccount = AccountLogin.checkSignIn(username:username! , password:password! ,loginAccount: accountLogin)
        if(userAccount == nil){
            loginmessage.text = "Invalid credentials. Try Again"
            print("Invalid credentials. Try Again")
        } else {
            AccountLogin.currentUser = Uname.text;
            print("Successfully Signed In");
        }
    }
    
 
    
    
    
    @IBAction func resetMessage(_ sender: Any) {
        loginmessage.text = ""
    }
    
    func initialize(){
        print ("initializing")
        var logintext = AccountLogin.readUserAccounts(loginAccount: accountLogin)
        Helpers.convertTextToUsers(text: logintext , loginAccount: &accountLogin);
       
    }
    
    
}

