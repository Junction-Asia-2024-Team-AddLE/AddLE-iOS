//
//  FirebaseService.swift
//  AddLE
//
//  Created by 이정동 on 8/10/24.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

final class FirebaseService {
  static let shared = FirebaseService()
  private init() {}
  
  private let store = Firestore.firestore()
  private let storage = Storage.storage(url: Bundle.main.STORAGE_URL)
}

// MARK: - FireStore
extension FirebaseService {
  func fetchStore() async -> [Violation] {
    var violations: [Violation?] = []
    do {
      let snapshot = try await store
        .collection(FStore.collection)
        .whereField(FStore.process, isEqualTo: 0)
        .getDocuments()
      
      for document in snapshot.documents {
        let data = try? document.data(as: Violation.self)
        violations.append(data)
      }
    } catch {
      print("Error getting documents: \(error)")
    }
    
    return violations.compactMap { $0 }
  }
}
