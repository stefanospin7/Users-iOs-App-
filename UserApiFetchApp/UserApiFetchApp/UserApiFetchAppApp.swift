//
//  UserApiFetchAppApp.swift
//  UserApiFetchApp
//
//  Created by Stefano  on 29/06/22.
//

import SwiftUI

@main
struct UserApiFetchAppApp: App {
    
    //add our Network class as an EnvironmentObject this way the objects ar called from the main
    var network = Network()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
