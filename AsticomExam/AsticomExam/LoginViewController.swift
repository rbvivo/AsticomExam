//
//  LoginViewController.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/22/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var fieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(mobileNumberField)
        stackView.addArrangedSubview(mpinField)

        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(loginButton)

        return stackView
    }()
    
    private lazy var  loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var mobileNumberField: FieldView = {
        let view = FieldView(placeHolder: "Enter Mobile Number", keyboardType: .numberPad, isSecure: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mpinField: FieldView = {
        let view = FieldView(placeHolder: "Enter MPIN", keyboardType: .numberPad, isSecure: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(fieldStackView)
        view.addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            fieldStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            fieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            buttonsStackView.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 20),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func loginPressed() {
       // self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func backPressed() {
        self.dismiss(animated: true, completion: nil)
    }

}
