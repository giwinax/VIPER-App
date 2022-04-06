//
//  CreateAccountAssembly.swift
//  VIPER-App
//
//  Created by s b on 05.04.2022.
//

import Foundation
import UIKit

class CreateAccountAssembly {
    static func assemblyCreateAccountModule() -> UIViewController {
        let view = CreateAccountView()
        let interactor = CreateAccountInteractor()
        let router = CreateAccountRouter()
        let presenter = CreateAccountPresenter(view: view, interactor: interactor, router: router)
        interactor.output = presenter
        view.output = presenter
        router.rootController = view
        return view
    }
}
