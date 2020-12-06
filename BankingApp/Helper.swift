//
//  Helper.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 29/11/20.
//

import Foundation
import UIKit
enum ReadDouble: Error {
    case InvalidNumberEntered
}
enum ReadInt: Error {
    case InvalidNumberEntered
}

//Helper class contains the common methods thats used across the application to avoid redundant code
class Helpers {
    
    /*Function to convert the text read from the file or the preloaded text to the format     * required for the object type BankAccount by sepreating it with the delimitter ","
     * parameters : Tect to be converted
     * returns void
     */
    static func convertTextToAccounts(text: String) -> [BankAccounts] {
        var Allaccounts: [BankAccounts] = []
        let arr = text.split(separator: "\n");
        arr.forEach{
            let details = $0.split(separator: ",");
            Allaccounts.append(BankAccounts(clientID: String(details[0]), accountType: String(details[1]), ClientName: String(details[2]), Contact: String(details[3]), accountNo: Int(String(details[4])) ?? 100000, currentBalance: (String(details[5]) as NSString).doubleValue,previousTransaction : (String(details[6]) as NSString).doubleValue))
        }
        return Allaccounts;
    }

    /*Function to convert the text read from the file or the preloaded text to the format     * required for the object type Account by sepreating it with the delimitter ","
     * parameters : Tect to be converted
     * returns void
     */
    static func convertTextToUsers(text: String) -> [AccountLogin] {
        var Alllogins: [AccountLogin] = []
        print (text)
        let arr = text.split(separator: "\n");
        arr.forEach{
            let details = $0.split(separator: ",");
            Alllogins.append(AccountLogin(username: String(details[0]), password: String(details[1])));
        }
        return Alllogins
    }
    
    //  func readDouble from text field throws error if input is invalid
    // helpful to avoid unwrapping nil values
    static func readDouble(field: UITextField!) throws  ->  Double {
        let val = Double(field.text!);
        
        guard val != nil else {
            throw ReadDouble.InvalidNumberEntered
        }
        
        return val!;
        
    }
    static func readInt(field: UITextField!) throws  ->  Int {
        let val = Int(field.text!);
        
        guard val != nil else {
            throw ReadInt.InvalidNumberEntered
        }
        
        return val!;
        
    }
    

}
