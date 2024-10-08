//
//  ContentView.swift
//  AddLE
//
//  Created by 이정동 on 8/9/24.
//

import SwiftUI

struct HomeView: View {
  @Environment(HomeViewModel.self) private var homeViewModel
  
  var body: some View {
    @Bindable var viewModel = homeViewModel
    NavigationStack {
      if homeViewModel.isLoading {
        ProgressView()
      } else {
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
              homeViewModel.violations = await fetchData()
          }
        }
        .navigationTitle("DitBool")
        .navigationBarTitleDisplayMode(.large)
        .alert("Delete violation", isPresented: $viewModel.isDisplayDeleteAlert) {
          Button(role: .destructive, action: {
            guard let vio = homeViewModel.selectedViolation else { return }
            homeViewModel.violations.removeAll { $0 == vio }
          }, label: {
            Text("Delete")
          })
          
          Button(role: .cancel) {
            homeViewModel.selectedViolation = nil
          } label: {
            Text("Cancel")
          }
        } message: {
          Text("This violation will be permanently deleted from this app.")
        }
      }
    }
    .task {
      homeViewModel.violations = await fetchData()
      homeViewModel.isLoading = false
    }
    
  }
  
  
  // MARK: - HeaderButton
  @ViewBuilder
  private func HeaderButton(width: CGFloat) -> some View {
    HStack(spacing: 0) {
      NavigationLink {
        NotificationView()
      } label: {
        VStack{
          Spacer()
          HStack(alignment: .firstTextBaseline) {
            Spacer()
            Text("Total")
              .font(AppFont.subtitleMedium)
              .kerning(-1)
            Text("2")
              .font(AppFont.pointBold)
              .kerning(-1)
          }
          .foregroundStyle(AppColor.backgroundWhite)
          
        }
        .padding(.bottom, 7)
        .padding(.trailing, 16)
      }
      .frame(width: max((width - 16) / 2, 0))
      .background(AppColor.blueKey)
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .overlay {
        Image(.bell)
          .resizable()
          .frame(width: 92, height: 80)
          .offset(x: -50, y: -35)
      }
      
      Spacer().frame(width: 16)
      
      NavigationLink {
        ProfileView()
      } label: {
        
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
      .frame(width: max((width - 16) / 2, 0))
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
    HStack(alignment: .center, spacing: 0) {
      Text("Violations ")
        .font(AppFont.titleBold)
      Text("(\(homeViewModel.violations.count))")
        .font(.custom(Pretendard.bold, size: 24))
      Spacer()
    }
    .foregroundStyle(AppColor.blackText)
    .padding(.top, 52)
    .padding(.horizontal, 24)
    
    
    LazyVStack(spacing: 32) {
      ForEach(homeViewModel.violations, id: \.self) { data in
        
        NavigationLink {
          DetailView(detailViewModel: DetailViewModel(violation: data))
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
    _ data: Violation,
    width: CGFloat
  ) -> some View {
    VStack {
      AsyncImage(url: URL(string: data.imageUrl)) { image in
        image
          .resizable()
          
          .clipShape(RoundedRectangle(cornerRadius: 28))
          .overlay {
            Button(
              action: {
                homeViewModel.selectedViolation = data
                homeViewModel.isDisplayDeleteAlert = true
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
          
      }
      .frame(
        width: max(width, 0),
        height: max(width, 0)
      )
      
      HStack {
        VStack(alignment: .leading) {
          Text("\(data.roadName)")
            .font(.custom(Pretendard.bold, size: 28))
            .lineLimit(1)
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

extension HomeView {
  private func fetchData() async -> [Violation] {
    await FirebaseService.shared.fetchStore()
  }
}

#Preview {
  HomeView()
    .environment(HomeViewModel())
}
