//
//  UIImageView+Extension.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import UIKit

extension UIImageView {
    
    func setImage(from urlString: String?) {
        guard let urlString = urlString else { return }
        do {
            let _ = try ImageLoader(url: urlString) { (data) in
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        } catch {
            // Handle error here in case it's needed
        }
    }

}
