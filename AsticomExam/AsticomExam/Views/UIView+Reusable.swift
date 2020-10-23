//
//  ReusableView.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import UIKit

public extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
