//
//  AppleLoginApp.swift
//  AppleLogin
//
//  Created by LeeJiSoo on 2022/05/22.
//

import SwiftUI
import Firebase

@main
struct AppleLoginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Initializing firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
