//
//  UIImageView+Extension.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        af.setImage(withURL: url)
    }

}
