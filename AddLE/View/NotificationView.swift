//
//  NotificationView.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import SwiftUI

struct NotificationView: View {
  
  
  var body: some View {
    ZStack {
      AppColor.backgroundWhite.ignoresSafeArea(edges: .bottom)
      
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          Image(.bell)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 120)
            
          
          HStack {
            VStack(alignment: .leading) {
              Text("Successfully processed!")
                .font(.custom(Pretendard.bold, size: 16))
              
              Text("Your tail light issue report has been successfully processed.")
                
                .multilineTextAlignment(.leading)
                .font(.custom(Pretendard.regular, size: 16))
            }
            Spacer()
          }
          .padding(.vertical, 12)
          .padding(.horizontal, 16)
          .frame(minWidth: 0, maxWidth: .infinity)
          .background(AppColor.blueSub)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(.horizontal, 16)
          
          HStack {
            VStack(alignment: .leading) {
              Text("Achieved 2nd place in local ranking!")
                .font(.custom(Pretendard.bold, size: 16))
              
              Text("With 12 achievements, you’ve reached 2nd place in this month’s local ranking. Keep it up!")
                
                .multilineTextAlignment(.leading)
                .font(.custom(Pretendard.regular, size: 16))
            }
            Spacer()
          }
          .padding(.vertical, 12)
          .padding(.horizontal, 16)
          .frame(minWidth: 0, maxWidth: .infinity)
          .background(AppColor.blueSub)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(.horizontal, 16)
        }
      }
      .navigationTitle("Notification")
      .navigationBarTitleDisplayMode(.inline)
      
    }
  }
  
}
#Preview {
  NotificationView()
}
