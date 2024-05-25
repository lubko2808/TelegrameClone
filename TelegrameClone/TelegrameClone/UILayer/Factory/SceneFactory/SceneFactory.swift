//
//  SceneFactory.swift
//  TelegrameClone
//
//  Created by Lubomyr Chorniak on 04.05.2024.
//

import UIKit

class SceneFactory {
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        
        return OnboardingViewController()
    }
    
    static func makeMainScene(coordinator: AppCoordinator) -> TabBarController {
        let contactsNavVC = UINavigationController()
        contactsNavVC.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.fill"), tag: 0)
        let contactsCoordinator = ContactsCoordinator(type: .contacts, navigationController: contactsNavVC, finishDelegate: coordinator)
        contactsCoordinator.start()
        
        let chatsNavVC = UINavigationController()
        chatsNavVC.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message.fill"), tag: 1)
        let chatsCoordinator = ChatsCoordinator(type: .chats, navigationController: chatsNavVC, finishDelegate: coordinator)
        chatsCoordinator.start()
        
        let settingsNavVC = UINavigationController()
        settingsNavVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        let settingsCoordinator = SettingsCoordinator(type: .settings, navigationController: settingsNavVC, finishDelegate: coordinator)
        settingsCoordinator.start()
        
        coordinator.addChildCoordinator(contactsCoordinator)
        coordinator.addChildCoordinator(chatsCoordinator)
        coordinator.addChildCoordinator(settingsCoordinator)
        
        return TabBarController(tabBarControllers: [contactsNavVC, chatsNavVC, settingsNavVC])
    }
    
    static func makeContactsScene(coordinator: ContactsCoordinator) -> ContactsViewController {
        let controller = ContactsViewController()
        return controller
    }
    
    static func makeChatsScene(coordinator: ChatsCoordinator) -> ChatsViewController {
        let controller = ChatsViewController()
        return controller
    }
    
    static func makeSettingsScene(coordinator: SettingsCoordinator) -> SettingsViewController {
        let presenter = SettingsPresenter(coordinator: coordinator)
        let controller = SettingsViewController(viewOutput: presenter)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeSignInScene(coordinator: AuthenticationCoordinator) -> SignInViewController {
        let presenter = SignInPresenter(coordinator: coordinator)
        let controller = SignInViewController(viewOutput: presenter)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeSignUpScene(coordinator: AuthenticationCoordinator) -> SignUpViewController {
        let presenter = SignUpPresenter(coordinator: coordinator)
        let controller = SignUpViewController(viewOutput: presenter)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeAuthenticationBeginningScene(coordinator: AuthenticationCoordinator) -> AuthenticationBeginningViewController {
        let presenter = AuthenticationBeginningPresenter(coordinator: coordinator)
        let controller = AuthenticationBeginningViewController(viewOutput: presenter)
        presenter.viewInput = controller
        return controller
    }
    
    static func makeForgotPasswordScene(coordinator: AuthenticationCoordinator) -> ForgotPasswordViewController {
        let presenter = ForgotPasswordPresenter(coordinator: coordinator)
        let controller = ForgotPasswordViewController(viewOutput: presenter)
        presenter.viewInput = controller
        return controller
    }
    
}

