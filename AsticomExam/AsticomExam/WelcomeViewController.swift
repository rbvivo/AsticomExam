//
//  WelcomeViewController.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/22/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerButton)
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
    
    private lazy var  registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(centerStackView)
        NSLayoutConstraint.activate([
            centerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            centerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func loginPressed() {
        let loginController = LoginViewController()
        self.present(loginController, animated: true, completion: nil)
    }
    
    @objc private func registerPressed() {
        let registerController = RegisterViewController()
        self.present(registerController, animated: true, completion: nil)
    }
}
