//
//  CreateAccountPresenter.swift
//  VIPER-App
//
//  Created by s b on 05.04.2022.
//

import Foundation

protocol CreateAccountPresenterInput {
    var output: CreateAccountPresenterOutput { get }
}

protocol CreateAccountPresenterOutput: AnyObject {
    
}

final class CreateAccountPresenter: CreateAccountPresenterOutput {
    weak var output: CreateAccountPresenterOutput?
    
    private let interactor: CreateAccountInteractor
    private let router: CreateAccountRouter
    private let view: CreateAccountView
    
    init(view: CreateAccountView, interactor: CreateAccountInteractor, router: CreateAccountRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CreateAccountPresenter: CreateAccountViewOutput {
    func userSelectCreateAccount(withLogin login: String, password: String) {
        interactor.createAccont(withLogin: login, password: password)
    }
}

extension CreateAccountPresenter: CreateAccountInteractorOutput {
    func didReceive(error: String) {
    }
    func didCreateAccount(withLogin login: String) {
        router.openAuthScreen(withLogin: login)
    }
}


