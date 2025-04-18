//
//  MoQooApp.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
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
struct MoQooApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dataManager = DataManager()


  var body: some Scene {
    WindowGroup {
      NavigationView {
          //TabBarView()
          LoginView()
              .environmentObject(dataManager)
      }
    }
  }
}

//@main
//struct MoQooApp: App {
//    var body: some Scene {
//        WindowGroup {
//            TabBarView()
//        }
//    }
//}
