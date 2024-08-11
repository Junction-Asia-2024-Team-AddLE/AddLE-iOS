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
  func createStore(_ data: Violation) async {
    do {
      let ref = try await store
        .collection(FStore.collection)
        .addDocument(data: [
          FStore.date : Date(),
          FStore.image : data.imageUrl,
          FStore.confidence : data.confidence,
          FStore.label : data.label,
          FStore.process : data.processStatus
        ])
      print("Document added with ID: \(ref.documentID)")
    } catch {
      print("Error adding document: \(error)")
    }
  }
  
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
    
    print("Fetch End")
    return violations.compactMap { $0 }
  }
}

// MARK: - Storage
extension FirebaseService {
  func uploadImage() async {
    let storageRef = storage.reference()
    let imagesRef = storageRef.child("images/\(UUID().uuidString).jpg")
    
    let image = UIImage(resource: .test)
    
    guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
    
    let result = try? await imagesRef.putDataAsync(imageData)
    print("Result: \(result)")
    
    let url = try? await imagesRef.downloadURL()
    
    let data = Violation(
      date: .now,
      imageUrl: url?.absoluteString ?? "",
      confidence: 0,
      label: 0,
      processStatus: 0
    )
    
    await createStore(data)
  }
  
}
