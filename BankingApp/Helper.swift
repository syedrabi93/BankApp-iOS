//
//  Helper.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 29/11/20.
//

import Foundation

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
    static func convertTextToUsers(text: String, loginAccount: inout [AccountLogin]) -> Void {
        let arr = text.split(separator: "\n");
        arr.forEach{
            let details = $0.split(separator: ",");
            loginAccount.append(AccountLogin(username: String(details[0]), password: String(details[1])));
        }
    }


}
