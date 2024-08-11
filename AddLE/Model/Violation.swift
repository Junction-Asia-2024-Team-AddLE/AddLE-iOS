//
//  ImageDetection.swift
//  AddLE
//
//  Created by 이정동 on 8/10/24.
//

import Foundation

struct Violation: Codable, Hashable {
  var id: UUID = UUID()
  var date: Date
  var imageUrl: String
  var latitude: Double
  var longitude: Double
  var status: Int
  var address: String
  var roadName: String
  
  enum CodingKeys: String, CodingKey {
    case date, latitude, longitude, status, address, roadName
    case imageUrl = "image"
  }
}

extension Violation {
  static let dummy: [Violation] = [
    .init(
      date: .now,
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvIoKwG69OJ-6ZY0nEXGm76c5A8XD1DrNEwA&s",
      latitude: 35.83855686330755,
      longitude: 129.28806264429252,
      status: 0,
      address: "Address",
      roadName: "Road Name"
    )
  ]
}
