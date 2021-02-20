//
//  SessionManager.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import Foundation
import Alamofire

final class SessionManager {
    
    func request<T: Decodable>(type _: T.Type, requestType: Request, completion handler: @escaping (Result<T, Error>) -> Void) {
        guard let url = requestType.url else {
            handler(Result.failure(CustomError.network))
            return
        }
        AF.request(url)
          .validate()
          .responseDecodable(of: T.self) { (response) in
            guard let object = response.value else { return }
            handler(Result.success(object))
        }
    }
    
}
