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
                
                GeometryReader { proxy in
                    let width = proxy.size.width
                    
                    VStack {
                        HStack(spacing: 0) {
                            Button(
                                action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                                label: {
                                    VStack{
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Text("총")
                                            Text("12")
                                            Text("건")
                                        }
                                    }
                                    .padding(12)
                                })
                            .frame(width: (width - 16) / 2)
                            .background(.red)
                            
                            Spacer().frame(width: 16)
                            
                            Button(
                                action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                                label: {
                                    VStack{
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            
                                        }
                                    }
                                    .padding(12)
                                })
                            .frame(width: (width - 16) / 2)
                            .background(.yellow)
                        }
                        .frame(height: 86)
                    }
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
