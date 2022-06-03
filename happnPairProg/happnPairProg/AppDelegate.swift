//
//  AppDelegate.swift
//  happnPairProg
//
//  Created by Julien Sechaud on 18/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var mainWindow: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let listVc = ListViewController()
		let removeVc = RemoveViewController()
		
		let tabBarVc = UITabBarController()
		tabBarVc.viewControllers = [listVc, removeVc]
		
		listVc.tabBarItem.title = "List"
		removeVc.tabBarItem.title = "Remove"
		
		mainWindow = UIWindow(frame: UIScreen.main.bounds)
		mainWindow?.rootViewController = tabBarVc
		mainWindow?.makeKeyAndVisible()		
		
		return true
	}
}

