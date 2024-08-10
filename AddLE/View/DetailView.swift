//
//  DetailView.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import SwiftUI
import MapKit

struct DetailView: View {
  @State private var selectedOption: Int = 1
  @State private var text: String = ""
  
  let imageData = ImageDetection.dummy[0]
  
  init() {
    UIScrollView.appearance().bounces = false
  }
  
  var body: some View {
    ZStack {
      AppColor.backgroundWhite.ignoresSafeArea(edges: .bottom)
      
      ScrollView {
        VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: imageData.imageUrl)) { image in
                      image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                      ProgressView()
                    }
          
          VStack(alignment: .leading, spacing: 40) {
            MapView()
            
            ComplaintPublicityView()
            
            DetailsTextFieldView()
          }
          .padding(16)
          
        }
      }
    }
    .navigationBarTitleDisplayMode(.inline)
  }
  
  @ViewBuilder
  private func MapView() -> some View {
    Text(imageData.date.koreanDateFormat)
      .font(.custom(Pretendard.regular, size: 16))
      .foregroundStyle(AppColor.blackText)
    
    Text("11, Yoodong-gil 26beon-gil")
      .font(.custom(Pretendard.bold, size: 24))
      .foregroundStyle(AppColor.blackText)
      .padding(.top, 20)
      .kerning(-1)
    
    Text("Namgu, Pohang-si, Gyeongsangbuk-do")
      .font(.custom(Pretendard.regular, size: 16))
      .foregroundStyle(AppColor.blackText)
    
    Map(
      initialPosition: .region(
        .init(
          center: .init(
            latitude: 35.83855686330755,
            longitude: 129.28806264429252
          ),
          latitudinalMeters: 200,
          longitudinalMeters: 200)
      )
    ) {
      Marker("", systemImage: "heart", coordinate: .init(
        latitude: 35.83855686330755,
        longitude: 129.28806264429252
      ))
    }
    .aspectRatio(1.5, contentMode: .fit)
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }
  
  @ViewBuilder
  private func ComplaintPublicityView() -> some View {
    
    VStack(alignment: .leading) {
      HStack {
        Text("Complaint Publicity")
          .font(.custom(Pretendard.bold, size: 24))
          .foregroundStyle(AppColor.blackText)
        
        Text("* Required")
          .font(.custom(Pretendard.regular, size: 12))
          .foregroundStyle(AppColor.redNoti)
      }
      
      HStack(spacing: 16) {
        Button(action: {
          selectedOption = 1 // 첫 번째 옵션 선택
        }) {
          HStack {
            Image(systemName: selectedOption == 1 ? "circle.fill" : "circle")
              .foregroundColor(selectedOption == 1 ? AppColor.blackText : AppColor.grayKey)
            Text("Yes")
          }
        }
        
        // 두 번째 체크박스
        Button(action: {
          selectedOption = 2 // 두 번째 옵션 선택
        }) {
          HStack {
            Image(systemName: selectedOption == 2 ? "circle.fill" : "circle")
              .foregroundColor(selectedOption == 2 ? AppColor.blackText : AppColor.grayKey)
            Text("No")
          }
        }
      }
      .padding(.top, 16)
      .foregroundStyle(AppColor.blackText)
      
    }
    
  }
  
  @ViewBuilder
  private func DetailsTextFieldView() -> some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Details")
        .font(.custom(Pretendard.bold, size: 24))
        .foregroundStyle(AppColor.blackText)
    
      CustomTextEditor(text: $text)
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
  }
}



#Preview {
  DetailView()
}
