//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 24/08/21.
//

import UIKit
import SafariServices

extension UIViewController {
    
    //put the behavior to show this alert
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .fullScreen
            alertVC.modalTransitionStyle   = .crossDissolve
            
            self.present(alertVC, animated: true)
        }
    }

    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
