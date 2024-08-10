//
//  ImageDetection.swift
//  AddLE
//
//  Created by 이정동 on 8/10/24.
//

import Foundation

struct ImageDetection: Codable, Hashable {
  var id: UUID = UUID()
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

extension ImageDetection {
  static let dummy: [ImageDetection] = [
    .init(
      date: .now,
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvIoKwG69OJ-6ZY0nEXGm76c5A8XD1DrNEwA&s",
      confidence: 0, label: 0, processStatus: 0),
    .init(
      date: .now,
      imageUrl: "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      confidence: 0, label: 0, processStatus: 0),
    .init(
      date: .now,
      imageUrl: "https://wallpapers.com/images/featured/free-background-9yo0cfxevhv8jmhq.jpg",
      confidence: 0, label: 0, processStatus: 0),
    .init(
      date: .now,
      imageUrl: "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      confidence: 0, label: 0, processStatus: 0),
    .init(
      date: .now,
      imageUrl: "https://wallpapers.com/images/featured/free-background-9yo0cfxevhv8jmhq.jpg",
      confidence: 0, label: 0, processStatus: 0)
  ]
}
