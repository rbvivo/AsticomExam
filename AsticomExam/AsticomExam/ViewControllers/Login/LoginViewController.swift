//
//  LoginViewController.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/22/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginSuccess: (() -> Void)?
    
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
        fieldCheck()
    }
    
    @objc private func backPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func fieldCheck() {
        var errorMessage = ""
        
        guard let mobileText = mobileNumberField.textFieldText(),
              let mpinText = mpinField.textFieldText(),
              !mobileText.isEmpty,
              !mpinText.isEmpty else {
            errorMessage = "Fill all fields"
            showAlert(errorMessage: errorMessage)
            return
        }
        
        if mobileText.count != 11 || !mobileText.hasPrefix("0") {
            errorMessage = "Mobile Invalid Format"
        } else if mpinText.count < 4 {
            errorMessage = "MPIN Invalid Format"
        }
        
        if errorMessage != "" {
            showAlert(errorMessage: errorMessage)
        } else {
            loginSuccess?()
        }
    }
    
    private func showAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
