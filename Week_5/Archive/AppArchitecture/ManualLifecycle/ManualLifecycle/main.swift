import Foundation
import UIKit

// Entry-point of Input Events and Thread to UIKit
class App: UIApplication {
	override func sendEvent(_ event: UIEvent) {
		print(event)
		super.sendEvent(event)
	}
}

// Lifecycle and System Integration
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UIStoryboard(name: "Main", bundle: nil)
			.instantiateInitialViewController()
		window?.makeKeyAndVisible()
		// Override point for customization after application launch.
		return true
	}
}

UIApplicationMain(CommandLine.argc,
									CommandLine.unsafeArgv,
									NSStringFromClass(App.self),
									NSStringFromClass(AppDelegate.self))
