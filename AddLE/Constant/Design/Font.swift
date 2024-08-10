//
//  Font.swift
//  AddLE
//
//  Created by 이정동 on 8/10/24.
//

import Foundation
import SwiftUI

struct Pretendard {
    static let black = "Pretendard-Black"
    static let bold = "Pretendard-Bold"
    static let extraBold = "Pretendard-ExtraBold"
    static let extraLight = "Pretendard-ExtraLight"
    static let light = "Pretendard-Light"
    static let medium = "Pretendard-Medium"
    static let regular = "Pretendard-Regular"
    static let semiBold = "Pretendard-SemiBold"
    static let thin = "Pretendard-Thin"
}

struct AppFont {
    // Point
    static let pointBold: Font = .custom(Pretendard.bold, size: 48)
    
    // Title
    static let titleBold: Font = .custom(Pretendard.bold, size: 32)
    static let titleMedium: Font = .custom(Pretendard.medium, size: 32)
    static let subtitleBold: Font = .custom(Pretendard.bold, size: 24)
    static let subtitleMedium: Font = .custom(Pretendard.medium, size: 24)
    
    // Footnote
    static let footnoteRegular: Font = .custom(Pretendard.regular, size: 16)
}
