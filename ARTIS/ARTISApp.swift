//
//  ARTISApp.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/09/22.
//

import SwiftUI
import Firebase

@main
struct ARTISApp: App {
    
//    @Environment(\.scenePhase) var scenePhase
    
    init() {
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                
                tabView()
            }
        }
//        .onChange(of: scenePhase) { phase in
//
//            switch phase {
//
//            case .background:
//                print("app on background")
//            case .inactive:
//                LocalFileManager.instance.removeCoverImage()
//            case .active:
//                print("app on active")
//            @unknown default:
//                print("New App state not yet introduced")
//            }
//        }
    }
}
