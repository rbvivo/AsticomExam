//
//  Reward.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

typealias RewardList = [Reward]
struct Reward: Codable {
    let id: Int
    let name: String
    let image: String
    let description: String
   
    
    init(id: Int, name: String, image: String, description: String) {
        self.id = id
        self.name = name
        self.image = image
        self.description = description
    }
}
