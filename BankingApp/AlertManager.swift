//
//  AlertManager.swift
//  BankingApp
//
//  Created by Adarshdeep Singh on 03/12/20.
//


import UIKit

class AlertManager {
    static func showAlert(title: String,msg: String, sender: UIViewController) -> Void {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
         sender.present(alertController, animated: true, completion: nil)
    }
}
