//
//  AccountSummaryView.swift
//  BankingApp
//
//  Created by Adarshdeep Singh on 30/11/20.
//

import UIKit

class AccountSummaryView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var accounts: [BankAccounts] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountcell") as! AccountSummryCell;
        
        let acc = accounts[indexPath.row];
        cell.initialize(accountNumber: acc.accountNo, balance: acc.currentBalance, type: acc.accountType, transaction: acc.previousTransaction)
        return cell;
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.delegate = self;
        accounts = BankAccounts.findAccountsByUsername(name: AccountLogin.currentUser!)
        
        print(accounts)
        // Do any additional setup after loading the view.
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
