//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 24/08/21.
//

import UIKit

extension UIViewController {
    //put the behavior to show this alert
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        
        //Easy way to throug things to the main thread
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .fullScreen
            alertVC.modalTransitionStyle   = .crossDissolve
            
            self.present(alertVC, animated: true)
        }
    }
    
}
