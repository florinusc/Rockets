//
//  String+Extension.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation

extension String {
    
    func formattedDate() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: self) else { return nil }
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date)
    }
    
}
