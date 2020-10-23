//
//  RewardService.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import Foundation

protocol RewardServiceProviding {
    
    func getImage(imageUrl: URL, completion: @escaping (APIResponse<Data>) -> Void)
}

class RewardService: RewardServiceProviding {
    
    func getImage(imageUrl: URL, completion: @escaping (APIResponse<Data>) -> Void) {
        let request = URLRequest(url: imageUrl,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        let session = URLSession.shared
        
        
        session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "Connection error", code: -1, userInfo: nil)
                    completion(.failure(error))
                }
            }
        }.resume()
    }

}
