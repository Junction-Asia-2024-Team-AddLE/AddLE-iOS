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
}

extension FirebaseService {
    func create() async {
//        store
//            .collection(FStore.collection)
//            .addDocument(data: [
//                FStore.date : Date(),
//                FStore.image : "www.google.com",
//                FStore.confidence : 0,
//                FStore.label : 0,
//                FStore.process : 0
//            ]) { error in
//                if error != nil {
//                    print(error?.localizedDescription)
//                } else {
//                    print("Create Success")
//                }
//            }
//        
        do {
            let ref = try await store
                .collection(FStore.collection)
                .addDocument(data: [
                    FStore.date : Date(),
                    FStore.image : "www.google.com",
                    FStore.confidence : 0,
                    FStore.label : 0,
                    FStore.process : 0
                ])
          print("Document added with ID: \(ref.documentID)")
        } catch {
          print("Error adding document: \(error)")
        }
    }
    
    func fetch() async {
        do {
            let snapshot = try await store.collection(FStore.collection).getDocuments()
            for document in snapshot.documents {
//                print("\(document.documentID) => \(document.data())")
                let data = try? document.data(as: ImageDetection.self)
                print(data)
            }
        } catch {
            print("Error getting documents: \(error)")
        }
    }
}
