//
//  CreateAccountInteractor.swift
//  VIPER-App
//
//  Created by s b on 05.04.2022.
//

import Foundation

protocol CreateAccountInteractorInput {
    var output: CreateAccountInteractorOutput? { get set }
    func createAccont(withLogin login: String, password: String)
}

protocol CreateAccountInteractorOutput {
    func didReceive(error: String)
    func didCreateAccount(withLogin login: String)
}

final class CreateAccountInteractor: CreateAccountInteractorInput {
    var output: CreateAccountInteractorOutput?
    
    func createAccont(withLogin login: String, password: String) {
     let _ = Account(login: login, password: password)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
        self?.output?.didCreateAccount(withLogin: login)
        }
    }
    
}
