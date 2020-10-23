//
//  WelcomeViewModel.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import Foundation

class WelcomeViewModel {

    func loadUser() -> User? {
        if let path  = Bundle.main.path(forResource: "User", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path),
           let user = try? PropertyListDecoder().decode(User.self, from: xml) {
            return user
        }
        return nil
    }
}
