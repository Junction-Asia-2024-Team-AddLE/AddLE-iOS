//
//  ImageDetection.swift
//  AddLE
//
//  Created by 이정동 on 8/10/24.
//

import Foundation

struct ImageDetection: Codable {
    var date: Date
    var imageUrl: String
    var confidence: Int
    var label: Int
    var processStatus: Int
    
    enum CodingKeys: String, CodingKey {
        case date, confidence, label
        case imageUrl = "image"
        case processStatus = "status"
    }
}

