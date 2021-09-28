//
//  AppDelegate.swift
//  BoringAPI
//
//  Created by Ярослав on 23.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let window = UIWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let provider = Provider()
        let presenter = Presenter()
        let interactor = Interactor(provider: provider, presenter: presenter)
        let controller = ViewController(interactor: interactor)
        presenter.viewController = controller
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        return true
    }

}

