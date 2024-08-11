//
//  DetailViewModel.swift
//  AddLE
//
//  Created by 이정동 on 8/11/24.
//

import Foundation

@Observable
final class DetailViewModel {
  var violation: Violation
  var policity: Bool = true
  var detail: String = ""
  var isDisplayConfirmAlert: Bool = false
  var isDisplayDoneAlert: Bool = false
  
  init(violation: Violation, policity: Bool = true, detail: String = "") {
    self.violation = violation
    self.policity = policity
    self.detail = detail
  }
}
