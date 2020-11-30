//
//  DepositViewController.swift
//  BankingApp
//
//  Created by Adarshdeep Singh on 30/11/20.
//

import UIKit

class DepositViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backClick(_ sender: Any) {
        print("CalledBack")
        performSegue(withIdentifier: "unwindtooptions", sender: self)
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
