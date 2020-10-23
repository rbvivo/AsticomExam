//
//  User.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

struct User: Codable {
    let id: String
    let first_name: String
    let last_name: String
    let mobile: String
    let is_verified: Bool
    let referral_code: String
    
    init(id: String, first_name: String, last_name: String, mobile: String, is_verified: Bool, referral_code: String) {
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.mobile = mobile
        self.is_verified = is_verified
        self.referral_code = referral_code
    }
}
