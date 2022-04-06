//
//  CreateAccountRouter.swift
//  VIPER-App
//
//  Created by s b on 05.04.2022.
//

import Foundation
import UIKit

protocol CreateAccountRouterInput {
    func openAuthScreen(withLogin login: String)
}

final class CreateAccountRouter: CreateAccountRouterInput {
    weak var rootController: UIViewController?
    
    func openAuthScreen(withLogin login: String) {
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .black
        rootController?.present(vc, animated: true, completion: nil)
    }
}
