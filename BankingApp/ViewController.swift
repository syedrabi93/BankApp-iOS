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
    
    
    
    
   
    @IBOutlet weak var Uname: UITextField!
    @IBOutlet weak var Pword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "SignUp", sender: self)
    }
    
   

    
    @IBAction func login(_ sender: Any) {
        let username = Uname.text
        let password = Pword.text
        let userAccount = AccountLogin.checkSignIn(username:username! , password:password!)
        if(userAccount == nil || username == "" || password == ""){
            
            let alertController = UIAlertController(title: "Login Error", message: "Invalid Username or Password", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            Uname.text = ""
            Pword.text = ""
            
        } else {
            AccountLogin.currentUser = Uname.text;
            performSegue(withIdentifier: "SignIn", sender: self)
        }
    }
    
 
    
    
    
   
    
    
    
}

