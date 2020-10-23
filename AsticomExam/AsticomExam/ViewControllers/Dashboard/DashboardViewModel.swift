//
//  DashboardViewModel.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//


class DashboardViewModel {
    
    var userName: String
    var mobileNumber: String
    var referalCode: String
    var rewardList: [Reward] = []
    
    init(userName: String, mobileNumber: String, referalCode: String) {
        self.userName = userName
        self.mobileNumber = mobileNumber
        self.referalCode = referalCode
    }
}
