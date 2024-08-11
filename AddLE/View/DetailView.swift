//
//  DetailView.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import SwiftUI
import MapKit

struct DetailView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(HomeViewModel.self) private var homeViewModel
  @State var detailViewModel: DetailViewModel
  
  let imageData = Violation.dummy[0]
  
  var body: some View {
    ZStack(alignment: .bottom) {
      AppColor.backgroundWhite.ignoresSafeArea(edges: .bottom)
      
      ScrollView {
        VStack(alignment: .leading) {
          AsyncImage(url: URL(string: detailViewModel.violation.imageUrl)) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
          } placeholder: {
            ProgressView()
              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 300)
              
          }
          
          
          VStack(alignment: .leading, spacing: 40) {
            MapView(detailViewModel.violation)
            
            ComplaintPublicityView()
            
            DetailsTextFieldView()
          }
          .padding(16)
          
        }
        .padding(.bottom, 80)
      }
      
      Button(
        action: {
          detailViewModel.isDisplayConfirmAlert = true
        },
        label: {
          HStack {
            Spacer()
            Text("Done")
              .font(.custom(Pretendard.bold, size: 24))
              .foregroundStyle(AppColor.backgroundWhite)
              .padding(.vertical, 10)
            Spacer()
          }
          
      })
      .background(AppColor.blueKey)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding()
    }
    .navigationTitle("Detail")
    .navigationBarTitleDisplayMode(.inline)
    .alert("Confirm your report", isPresented: $detailViewModel.isDisplayConfirmAlert, actions: {
      Button(action: {
        detailViewModel.isDisplayDoneAlert = true
      }, label: {
        Text("Submit")
      })
      
      Button(role: .cancel) {
        
      } label: {
        Text("Cancel")
      }
    }, message: {
      Text("Your report will be submitted anonymously.")
    })
    .alert("Submitted Successfully", isPresented: $detailViewModel.isDisplayDoneAlert, actions: {
      Button(action: {
        homeViewModel.violations.removeAll { $0 == detailViewModel.violation }
        dismiss()
      }, label: {
        Text("Done")
      })
    }) {
      Text("Report processing may take 3-5 days.")
    }
    
  }
  
  @ViewBuilder
  private func MapView(_ data: Violation) -> some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(data.date.koreanDateFormat)
        .font(.custom(Pretendard.regular, size: 16))
        .foregroundStyle(AppColor.blackText)
      
      Text("\(data.roadName)")
        .font(.custom(Pretendard.bold, size: 24))
        .foregroundStyle(AppColor.blackText)
        .padding(.top, 20)
        .kerning(-1)
      
      Text("\(data.address)")
        .font(.custom(Pretendard.regular, size: 16))
        .foregroundStyle(AppColor.blackText)
        .padding(.top, 8)
      
      Map(
        initialPosition: .region(
          .init(
            center: .init(
              latitude: data.latitude,
              longitude: data.longitude
            ),
            latitudinalMeters: 200,
            longitudinalMeters: 200)
        )
      ) {
        Marker("", systemImage: "mappin", coordinate: .init(
          latitude: data.latitude,
          longitude: data.longitude
        ))
      }
      .aspectRatio(1.5, contentMode: .fit)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(.top, 24)
    }
    
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
          detailViewModel.policity = true // 첫 번째 옵션 선택
        }) {
          HStack {
            Image(systemName: detailViewModel.policity ? "circle.fill" : "circle")
              .foregroundColor(detailViewModel.policity ? AppColor.blackText : AppColor.grayKey)
            Text("Yes")
          }
        }
        
        // 두 번째 체크박스
        Button(action: {
          detailViewModel.policity = false // 두 번째 옵션 선택
        }) {
          HStack {
            Image(systemName: !detailViewModel.policity ? "circle.fill" : "circle")
              .foregroundColor(!detailViewModel.policity ? AppColor.blackText : AppColor.grayKey)
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
      
      CustomTextEditor(text: $detailViewModel.detail)
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
  }
}



#Preview {
  DetailView(detailViewModel: DetailViewModel(violation: Violation.dummy[0]))
    .environment(HomeViewModel())
}
