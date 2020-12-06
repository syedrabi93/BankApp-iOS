//
//  AccountSummryCell.swift
//  BankingApp
//
//  Created by Adarshdeep Singh on 30/11/20.
//

import UIKit

class AccountSummryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    @IBOutlet weak var prevTransaction: UITextField!
    
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var balance: UITextField!
    @IBOutlet weak var accountnumber: UITextField!
    
    // initializing table view cell with initial values
    func initialize(accountNumber: Int, balance: Double, type: String, transaction: Double){
        
        self.accountnumber.text = String(accountNumber);
        self.balance.text = String(balance);
        
        self.type.text = type
        self.prevTransaction.text = String(transaction)
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
