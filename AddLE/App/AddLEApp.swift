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
  
  init() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.backgroundColor = UIColor.white // Navigation Bar 배경색 설정
    
    // 타이틀 텍스트의 색상 설정
    appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    
    // UINavigationBarAppearance 설정 적용
//    UINavigationBar.appearance().standardAppearance = appearance
//    UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    UINavigationBar.appearance().compactAppearance = appearance
  }
  
  var body: some Scene {
    WindowGroup {
      HomeView()
    }
  }
}
