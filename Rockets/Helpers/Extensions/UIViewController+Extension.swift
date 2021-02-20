//
//  UIViewController+Extension.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import UIKit

extension UIViewController {
    
    func presentAlert(for error: Error, with handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alert.view.tintColor = .systemBlue
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
