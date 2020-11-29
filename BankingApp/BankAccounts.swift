//
//  BankAccounts.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 29/11/20.
//

import Foundation

class BankAccounts{
    
    var clientID: String;
    var accountType: String;
    var ClientName: String;
    var Contact: String;
    var accountNo: Int;
    var currentBalance: Double;
    var previousTransaction: Double ;
    
    //Initialization
    init (clientID: String , accountType: String , ClientName: String , Contact: String , accountNo: Int ,currentBalance: Double , previousTransaction: Double  ){
        self.clientID = clientID
        self.accountType = accountType
        self.ClientName = ClientName
        self.Contact = Contact
        self.accountNo = accountNo
        self.currentBalance = currentBalance
        self.previousTransaction = previousTransaction
    }
    
    
    
    
    
    
    
    
    /* function to preload the customer details if the file is not empty
     * if not load the customer login data from from here (testing purpose)
     */
    static func readBankAccounts (AllAccounts: [BankAccounts])-> String {
        let file = "AccountDetails.txt" //this is the file. we will write to and read from it
        
        var text = """
            Syed,Savings,SyedRabiyama,9789547607,100001,10000,100
            Syed,Current,SyedRabiyama,9789547607,100002,1000,1000
            Adarsh,Savings,Adharshdeep,9876543210,100003,5000,1000
            """ //just a text
        let textFromFile = FileReader.readFromFile(fileName: file);
        if !textFromFile.isEmpty {
            text = textFromFile;
        }
        return text
    }
    
    //Function to finally update the file with the data while leaving the application
    //loads the data from objects to the file for permanent storage
    static func saveAccounts (AllAccounts: [BankAccounts])-> Void {
        var text = "";
        for account in AllAccounts {
            text.append(contentsOf: "\(account.clientID),\(account.accountType),\(account.ClientName),\(account.Contact),\(account.accountNo),\(account.currentBalance),\(account.previousTransaction)\n") ;
        }
        
        FileReader.saveToFile(fileName: "AccountDetails.txt", content: text);
    }
    
    //checks if the logged in customer is an active account holder
    static func isCustomerExist(user : String , AllAccounts: [BankAccounts])-> Bool
    {
        if (AllAccounts.firstIndex(where: {$0.clientID == user}) != nil) == true {
            return true
        }
        return false
    }
}
