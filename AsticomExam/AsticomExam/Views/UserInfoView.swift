//
//  UserInfoView.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import UIKit

class UserInfoView: UIView {
    
    private var userName: String?
    private var mobileNumber: String?
    private var referalCode: String?
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = userName
        label.font = .systemFont(ofSize: 38)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var mobileNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = mobileNumber
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var referalCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = referalCode
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var fieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(mobileNumberLabel)
        stackView.addArrangedSubview(referalCodeLabel)
        
        return stackView
    }()
    
    init(userName: String, mobileNumber: String, referalCode: String) {
        self.userName = userName
        self.mobileNumber = mobileNumber
        self.referalCode = referalCode
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .blue
        self.addSubview(fieldStackView)
        NSLayoutConstraint.activate([
            fieldStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            fieldStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            fieldStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            fieldStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}
