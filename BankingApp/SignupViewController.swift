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
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
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
