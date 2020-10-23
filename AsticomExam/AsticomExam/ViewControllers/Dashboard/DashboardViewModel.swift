//
//  DashboardViewModel.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import Foundation

class DashboardViewModel {
    
    var userName: String
    var mobileNumber: String
    var referalCode: String
    var rewardList: [Reward] = []
    
    init(userName: String, mobileNumber: String, referalCode: String) {
        self.userName = userName
        self.mobileNumber = mobileNumber
        self.referalCode = referalCode
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
