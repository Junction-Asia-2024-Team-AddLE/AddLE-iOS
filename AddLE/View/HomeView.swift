//
//  ContentView.swift
//  AddLE
//
//  Created by 이정동 on 8/9/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                AppColor.backgroundWhite.ignoresSafeArea(edges: .bottom)
                
                Divider()
                
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .padding()
            }
            
            .navigationTitle("딧불")
        }
        
    }
}

#Preview {
    HomeView()
}
