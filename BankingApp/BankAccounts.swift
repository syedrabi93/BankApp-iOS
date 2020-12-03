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
    static func readBankAccounts ()-> [BankAccounts] {
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
        return Helpers.convertTextToAccounts(text: text);
    }
    
    
    
    static func findAccountsByUsername(name: String) -> [BankAccounts] {
        let AllAccounts = readBankAccounts();
      
        var userAcc:[BankAccounts] = []
        for acc in AllAccounts {
            if(acc.clientID == name){
                userAcc.append(acc)
            }
        }
        return userAcc;
    }
    
    static func findByAccountNum(allAccounts:[BankAccounts],num: Int) -> BankAccounts? {
        var acc: BankAccounts?;
        for account in allAccounts {
            if(account.accountNo == num){
                acc = account;
                break;
            }
        }
        return acc;
    }
    
    static func deleteAccount(accNum: Int)-> String {
        var allAccounts = readBankAccounts();
        let index = allAccounts.firstIndex(where: { $0 .accountNo == accNum});
        if(index == nil){
            return "Couldnt Find account with Account Number \(accNum)"
        }
        allAccounts.remove(at: index!)
        saveAccounts(AllAccounts: allAccounts);
        return "Account No. \(accNum) deleted";
    }
    
    static func createAccount(type: String, accNumber: Int) -> String{
        var accs = readBankAccounts();
        let acc = findByAccountNum(allAccounts: accs, num: accNumber);
        if(acc !== nil){
            return "Account No. \(accNumber) already Taken";
        }
        let currentUserAccounts = findAccountsByUsername(name: AccountLogin.currentUser!);
        let newAcc = BankAccounts(clientID: AccountLogin.currentUser!, accountType: type, ClientName: currentUserAccounts[0].ClientName, Contact: currentUserAccounts[0].Contact, accountNo: accNumber, currentBalance: 0, previousTransaction: 0);
        accs.append(newAcc);
        saveAccounts(AllAccounts: accs);
        return "\(type) account created with Account number \(accNumber)";
    }
    
    
    static func updateDetails(name: String, contact: String)-> String {
        let user = AccountLogin.currentUser;
        if(user == nil){
            return "Not Able To Change Details";
        }
        let accounts = readBankAccounts();
        var userAcc:[BankAccounts] = []
        for acc in accounts {
            if(acc.clientID == user){
                userAcc.append(acc)
            }
        }
        
        for acc in userAcc {
            acc.ClientName = name;
            acc.Contact = contact;
        }
        saveAccounts(AllAccounts: accounts);
        return "Details Updated";
    }
    
    static func payUtility(acc: Int,util: String, amount: Double) -> String{
        
        let allAccounts = readBankAccounts();
        let account = findByAccountNum(allAccounts: allAccounts, num: acc);
        
        if(account == nil){
            return "Couln't Find Account Num \(acc)"
            
        }
        account!.currentBalance = account!.currentBalance - amount;
        account!.previousTransaction = amount;
        saveAccounts(AllAccounts: allAccounts);
        return "Paid $\(amount) for utility \(util)"
    }
    
    static func depositMoney (accNum: Int,amount: Double) -> String {
         let allAccounts = readBankAccounts();
        let acc = findByAccountNum(allAccounts: allAccounts, num: accNum);
        if(acc == nil){
            return "Couldn't Find Account";
        }
        acc!.currentBalance = acc!.currentBalance + amount;
        acc!.previousTransaction = amount;
        saveAccounts(AllAccounts: allAccounts);
        return "Amount $\(amount) deposited to Account \(accNum)"
    }
    
    static func transferAmount(accNum1: Int, accNum2: Int, amount: Double) -> String {
        let allAccounts = readBankAccounts();
        let fromAccount = findByAccountNum(allAccounts: allAccounts, num: accNum1);
        let toAccount = findByAccountNum(allAccounts: allAccounts, num: accNum2);
        if(toAccount == nil){
            return "Invalid Destination Account Number";
        }
        if(fromAccount == nil){
            return "Invalid Source Account Number";
        }
        
        if(fromAccount!.currentBalance < amount ){
            return "You have insufficient Funds in  \(fromAccount!.accountNo)"
        }
        
        fromAccount!.currentBalance = fromAccount!.currentBalance - amount;
        
        toAccount!.currentBalance = toAccount!.currentBalance + amount;
        fromAccount?.previousTransaction = amount;
        toAccount?.previousTransaction = amount;
        saveAccounts(AllAccounts: allAccounts);
        return "Amount $\(amount) Transferred to \(toAccount?.ClientName ?? "")";
        
    }
    
    static func generateAccountNum() -> Int{
        let AllAccounts = readBankAccounts();
               var randNum = 0;
               while true {
                   let generatedNum = Int(drand48() * 10000 + 10000);
                   let index = AllAccounts.firstIndex(where: {$0.accountNo == generatedNum});
                   if index == nil {
                       randNum = generatedNum;
                       break;
                       
                   }
               }
               return randNum;
           }
    
    //Function to finally update the file with the data while leaving the application
    //loads the data from objects to the file for permanent storage
    static func saveAccounts (AllAccounts: [BankAccounts])-> Void {
        var text = "";
        for account in AllAccounts {
            text.append(contentsOf: "\(account.clientID),\(account.accountType),\(account.ClientName),\(account.Contact),\(account.accountNo),\(account.currentBalance),\(account.previousTransaction)\n") ;
        }
        print(text)
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
