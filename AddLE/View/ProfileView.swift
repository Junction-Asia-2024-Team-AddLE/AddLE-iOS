//
//  ProfileView.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import SwiftUI

struct ProfileView: View {
  
  var body: some View {
    
    ZStack {
      AppColor.backgroundWhite.ignoresSafeArea(edges: .bottom)
      
      VStack(alignment: .leading, spacing: 40) {
        Image(.taxi)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 120)
        
        NameTextField()
        
        ContactTextField()
        
        AddressTextField()
        
        Spacer()
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      
    }
    .navigationTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button(
          action: {},
          label: {
            Text("Done")
        })
      }
    }
  }
  
  // MARK: - NameTextField
  @ViewBuilder
  private func NameTextField() -> some View {
    VStack(alignment: .leading) {
      Text("Name")
        .foregroundStyle(AppColor.blackText)
        .font(.custom(Pretendard.bold, size: 24))
      
      HStack {
        Text("Ditbool Ban")
        Spacer()
      }
      .padding(.vertical, 10)
      .padding(.horizontal, 12)
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(AppColor.grayKey)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .foregroundStyle(AppColor.blackText)
    }
  }
  
  // MARK: - ContactTextField
  @ViewBuilder
  private func ContactTextField() -> some View {
    VStack(alignment: .leading) {
      Text("Contact")
        .foregroundStyle(AppColor.blackText)
        .font(.custom(Pretendard.bold, size: 24))
      
      HStack {
        Text("010")
          .padding(.vertical, 10)
          .padding(.horizontal, 12)
          .background(AppColor.grayKey)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .foregroundStyle(AppColor.blackText)
        Text("-")
        Text("8282")
          .padding(.vertical, 10)
          .padding(.horizontal, 12)
          .background(AppColor.grayKey)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .foregroundStyle(AppColor.blackText)
        Text("-")
        Text("7979")
          .padding(.vertical, 10)
          .padding(.horizontal, 12)
          .background(AppColor.grayKey)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .foregroundStyle(AppColor.blackText)
      }
    }
  }
  
  // MARK: - AddressTextField
  @ViewBuilder
  private func AddressTextField() -> some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Address")
        .foregroundStyle(AppColor.blackText)
        .font(.custom(Pretendard.bold, size: 24))
      
      HStack {
        Text("07060")
          .padding(.vertical, 10)
          .padding(.horizontal, 12)
          .background(AppColor.grayKey)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .foregroundStyle(AppColor.blackText)
        
        Text("Find")
          .padding(.vertical, 10)
          .padding(.horizontal, 12)
          .background(AppColor.blackText)
          .clipShape(RoundedRectangle(cornerRadius: 4))
          .foregroundStyle(AppColor.backgroundWhite)
      }
      
      HStack {
        Text("11,Yoodong-gil 26beon-gil, Namgu")
        Spacer()
      }
      .padding(.vertical, 10)
      .padding(.horizontal, 12)
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(AppColor.grayKey)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .foregroundStyle(AppColor.blackText)
      
      HStack {
        Text("Pohang-si, Gyeongsangbuk-do")
        Spacer()
      }
      .padding(.vertical, 10)
      .padding(.horizontal, 12)
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(AppColor.grayKey)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .foregroundStyle(AppColor.blackText)
    }
    
  }
}

#Preview {
  ProfileView()
}
