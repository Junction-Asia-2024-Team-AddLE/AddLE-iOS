//
//  AddLEApp.swift
//  AddLE
//
//  Created by 이정동 on 8/9/24.
//

import SwiftUI

@main
struct AddLEApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
