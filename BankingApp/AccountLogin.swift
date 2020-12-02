//
//  Loginclass.swift
//  BankingApp
//
//  Created by S, Syed Rabiyama on 29/11/20.
//

import Foundation

class AccountLogin{
    
    var username: String;
    var password: String;
    
    init(username: String, password: String){
            self.username = username
            self.password = password
    }
    
    
    static var currentUser: String?
    
    /* Function to validate the sign in for the given username and password
         * gets the user name and passwork on run time and validates if its a valid login
         * parameters: USertype
         * returns void
         */
    static func checkSignIn(username:String , password:String ) -> AccountLogin? {
        let Alllogins = readUserAccounts();
            var currentUser: AccountLogin? = nil;
            for user in Alllogins {
                if user.password == password && user.username == username {
                    currentUser = user;
                    break;
                }
            }
            return currentUser;
        }
    /* function to preload the user details if the file is not empty
         * if not load the customer login data from from here (testing purpose)
         */
        static func readUserAccounts () -> [AccountLogin] {
            let fileName = "Users.txt";
            var text = """
            Syed,test1
            Adarsh,test2
            Kaur,test3
            Wajeeh,test4
            """;
            let textFromFile = FileReader.readFromFile(fileName: fileName);
            if !textFromFile.isEmpty {
                text = textFromFile;
            }
            return Helpers.convertTextToUsers(text: text)
            
            
        }
    //Function to finally update the file with the data while leaving the application
        //loads the data from objects to the file for permanent storage
        
        static func saveUserAccounts (account: [AccountLogin]) -> Void {
            var text = "";
            for user in account {
                text.append(contentsOf: "\(user.username),\(user.password)\n") ;
            }
            print (text)
            FileReader.saveToFile(fileName: "Users.txt", content: text);
            
        }
}
