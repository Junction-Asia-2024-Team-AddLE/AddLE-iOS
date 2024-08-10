//
//  Date+Ext.swift
//  AddLE
//
//  Created by 이정동 on 8/10/24.
//

import Foundation

extension Date {
  
  /// yyyy.MM.dd hh:mm
  var koreanDateFormat: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd hh:mm"
    return formatter.string(from: self)
  }
}
