//
//  SceneDelegate.swift
//  DemoLibrary
//
//  Created by Bilal Ahmad on 10/04/2020.
//  Copyright © 2020 Bilal Ahmed. All rights reserved.
//

import UIKit
import Sentry
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        _ = SentrySDK(options: [
            "dsn": "https://6213ac3d24a84dafb01240ce115cdb3e@o360787.ingest.sentry.io/3706451",
            "debug": true // Enabled debug when first installing is always helpful
        ])
        if let windowscene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowscene)
            
            window.rootViewController = SentryEventVC()

            self.window = window
            window.makeKeyAndVisible()
        }
        

        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

