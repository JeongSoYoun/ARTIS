////
////  Networking.swift
////  ARTIS
////
////  Created by 정소윤 on 2021/12/01.
////
//
//import Foundation
//import Firebase
//import UIKit
//
//class NetworkManager {
//
//    static func downloadData(collection: String) throws -> [News]? {
//
//        let db = Firestore.firestore()
//
//        var data: [News] = []
//        let snapshot = try? db.collection(collection).getDocuments()
//        
//        if let snapshot = snapshot {
//
//            data = snapshot.documents.map { document in
//
//                let category = document["category"] as? String ?? ""
//                let createdAt = document["createdAt"] as? Double ?? 0.0
//                let tag = document["tag"] as? [String] ?? []
//                let title = document["title"] as? String ?? ""
//
//                return News(id: document.documentID, category: category, createdAt: createdAt, tag: tag, title: title)
//            }
//
//            return data
//        } else {
//
//            return nil
//        }
//    }
//}
