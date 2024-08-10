//
//  ContentView.swift
//  AddLE
//
//  Created by 이정동 on 8/9/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await FirebaseService.shared.uploadImage()
        }
    }
}

#Preview {
    HomeView()
}
