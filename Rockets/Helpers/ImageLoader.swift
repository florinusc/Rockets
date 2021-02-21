//
//  ImageLoader.swift
//  Rockets
//
//  Created by Florin Uscatu on 21.02.2021.
//

import Foundation
import SwiftUI
import Alamofire

final class ImageLoader: ObservableObject {
    var data: Data?

    init(url: String, _ handler: ((Data?) -> Void)? = nil) throws {
        guard let parsedURL = URL(string: url) else {
            throw CustomError.custom(message: "Image can't be loaded")
        }
        getData(from: parsedURL, handler)
    }
    
    private func getData(from url: URL, _ handler: ((Data?) -> Void)? = nil) {
        AF.request(url)
            .responseData { [weak self] (response) in
                self?.data = response.data
                self?.objectWillChange.send()
                handler?(response.data)
            }
    }
}
