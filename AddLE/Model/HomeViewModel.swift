//
//  HomeViewModel.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import Foundation

@Observable
final class HomeViewModel {
  var violations: [Violation] = []
  var isLoading: Bool = false
  var isDisplayDeleteAlert: Bool = false
  var selectedViolation: Violation?
}
