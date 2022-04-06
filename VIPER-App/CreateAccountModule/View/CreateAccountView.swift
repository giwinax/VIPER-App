//
//  CreateAccountView.swift
//  VIPER-App
//
//  Created by s b on 05.04.2022.
//

import UIKit

protocol CreateAccountViewInput {
    var output: CreateAccountViewOutput? { get set }
}

protocol CreateAccountViewOutput {
    func userSelectCreateAccount(withLogin login: String, password: String)
}

final class CreateAccountView: UIViewController, CreateAccountViewInput {
    var output: CreateAccountViewOutput?
    
    private let loginLabel: UILabel
    private let passwordLabel: UILabel
    private let acceptButton: UIButton
    
    init() {
        loginLabel = UILabel()
        passwordLabel = UILabel()
        acceptButton = UIButton()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(acceptButton)
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -16),
            passwordLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            acceptButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 24),
            acceptButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            acceptButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50),
            acceptButton.heightAnchor.constraint(equalToConstant: 30)])
        loginLabel.text = "user123"
        loginLabel.textColor = .black
        passwordLabel.text = "password123"
        loginLabel.textColor = .black
        acceptButton.setTitle("Создать аккаунт", for: .normal)
        
        acceptButton.backgroundColor = .gray
        
        acceptButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        output?.userSelectCreateAccount(withLogin: loginLabel.text ?? "", password: passwordLabel.text ?? "")
    }
    
}
