//
//  DashboardViewModel.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import Foundation

class DashboardViewModel {
    
    var user: User
    var rewardList: [Reward] = []
    
    init(user: User) {
        self.user = user
        loadRewards()
    }
    
    func loadRewards() {
        if let path  = Bundle.main.path(forResource: "Rewards", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path),
           let list = try? PropertyListDecoder().decode([Reward].self, from: xml) {
            rewardList = list
        }
    }
}
