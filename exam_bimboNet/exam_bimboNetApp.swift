//
//  exam_bimboNetApp.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 20/12/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct exam_bimboNetApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authViewModel = AuthViewModel()
    @State private var isLaunchViewPresented = true
    @StateObject var network = Network()
    
    var body: some Scene {
        WindowGroup {
            if !isLaunchViewPresented{
                if let _ = authViewModel.emailUser{
                    HomeView(authViewModel: authViewModel)
                        .preferredColorScheme(.light)
                        .environmentObject(network)
                }else{
                    AuthenticationView(authViewModel: authViewModel)
                        .preferredColorScheme(.light)
                        .environmentObject(network)
                }
            }else{
                LaunchView(ispresented: $isLaunchViewPresented)
            }
        }
    }
}
