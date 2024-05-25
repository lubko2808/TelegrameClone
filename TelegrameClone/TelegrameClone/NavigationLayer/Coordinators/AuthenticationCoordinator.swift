//
//  RegistrationCoordinator.swift
//  TelegrameClone
//
//  Created by Lubomyr Chorniak on 04.05.2024.
//

import Foundation

final class AuthenticationCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    
    override func start() {
        showInitialScene()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
    
}

// MARK: - Navigation
extension AuthenticationCoordinator {
    
    func showInitialScene() {
        let viewController = factory.makeAuthenticationBeginningScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showSignInScene() {
        let viewController = factory.makeSignInScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showSignUpScene() {
        let viewController = factory.makeSignUpScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func showForgotPasswordScene() {
        let viewController = factory.makeForgotPasswordScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
}
