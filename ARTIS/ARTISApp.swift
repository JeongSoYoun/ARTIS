//
//  ARTISApp.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/09/22.
//

import SwiftUI

@main
struct ARTISApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                
                TabView {
                 
                    HomeView()
                        .navigationBarHidden(true)
                        .tabItem {
                            
                            Image(systemName: "eye")
                            Text("INSIGHT")
                        }
                }
                .accentColor(Color("myColor"))
            }
        }
    }
}
