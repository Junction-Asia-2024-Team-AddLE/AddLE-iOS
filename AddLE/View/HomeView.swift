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
        GeometryReader { proxy in
          let width = proxy.size.width - (16 * 2)
          
          
          ScrollView(.vertical) {
            VStack {
              HeaderButton(width: width)
                .padding(.top, 30)
                .padding(.horizontal, 16)
              
              ViolationsView(width: width)
            }
          }
          .background(AppColor.backgroundWhite)
          .refreshable {
            print("Refresh")
          }
      }
      .navigationTitle("DitBool")
      .navigationBarTitleDisplayMode(.automatic)
    }
  }
  
  // MARK: - HeaderButton
  @ViewBuilder
  private func HeaderButton(width: CGFloat) -> some View {
    HStack(spacing: 0) {
      Button(
        action: {
          
        },
        label: {
          VStack{
            Spacer()
            HStack(alignment: .firstTextBaseline) {
              Spacer()
              Text("Total")
                .font(AppFont.subtitleMedium)
                .kerning(-1)
              Text("12")
                .font(AppFont.pointBold)
                .kerning(-1)
            }
            .foregroundStyle(AppColor.backgroundWhite)
            
          }
          .padding(.bottom, 7)
          .padding(.trailing, 16)
          
        })
      .frame(width: (width - 16) / 2)
      .background(AppColor.blueKey)
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .overlay {
        Image(.bell)
          .resizable()
          .frame(width: 92, height: 80)
          .offset(x: -50, y: -35)
      }
      
      Spacer().frame(width: 16)
      
      Button(
        action: {
          
        },
        label: {
          ZStack {
            VStack{
              Spacer()
              HStack {
                Spacer()
                Text("Profile")
                  .font(AppFont.subtitleMedium)
                  .kerning(-1)
                  .foregroundStyle(AppColor.blackText)
              }
            }
            .padding(.bottom, 12)
            .padding(.trailing, 16)
          }
        })
      .frame(width: (width - 16) / 2)
      .background(AppColor.blueSub)
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .overlay {
        Image(.taxi)
          .resizable()
          .frame(width: 92, height: 80)
          .offset(x: -30, y: -35)
      }
    }
    .frame(height: 86)
  }
  
  // MARK: - ViolationsView
  @ViewBuilder
  private func ViolationsView(width: CGFloat) -> some View {
    HStack {
      Text("Violations")
        .font(AppFont.titleBold)
      Spacer()
    }
    .padding(.top, 52)
    .padding(.horizontal, 24)
    
    
    LazyVStack(spacing: 32) {
      ForEach(ImageDetection.dummy, id: \.self) { data in
        
        NavigationLink {
          DetailView()
        } label: {
          ViolationsListCell(data, width: width)
            .padding(.horizontal, 16)
            
        }
      }
    }
  }
  
  // MARK: - ViolationsListCell
  @ViewBuilder
  private func ViolationsListCell(
    _ data: ImageDetection,
    width: CGFloat
  ) -> some View {
    VStack {
      AsyncImage(url: URL(string: data.imageUrl)) { image in
        image
          .resizable()
          .frame(width: width, height: width)
          .clipShape(RoundedRectangle(cornerRadius: 28))
          .overlay {
            Button(
              action: {
                
              },
              label: {
                ZStack {
                  Circle()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(AppColor.grayKey)
                  Image(systemName: "xmark")
                    .frame(width: 35, height: 35)
                    .foregroundStyle(AppColor.blackText)
                }
            })
            .offset(x: (width / 2) - 18, y: -(width / 2))
          }
      } placeholder: {
        ProgressView()
          .frame(width: width, height: width)
      }
      
      HStack {
        VStack(alignment: .leading) {
          Text("Yoodong-gil 26th 11")
            .font(.custom(Pretendard.bold, size: 28))
          Text(data.date.koreanDateFormat)
            .font(.custom(Pretendard.regular, size: 16))
        }
        
        Spacer()
        Image(systemName: "chevron.right")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
      }
      .padding(.horizontal)
      .foregroundStyle(AppColor.blackText)
      
    }
  }
}

#Preview {
  HomeView()
}
