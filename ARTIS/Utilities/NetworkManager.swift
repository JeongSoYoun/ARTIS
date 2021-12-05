//
//  Networking.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/01.
//

import Foundation
import Firebase
import UIKit

class NetworkManager {

    static func downloadNewsData(collection: String, completion: @escaping ([News]) -> Void) {
        
        let db = Firestore.firestore()
        var data = [News]()
        
        DispatchQueue.global(qos: .default).async {
            
            db.collection(collection).getDocuments { snapshot, error in
                
                if error == nil {
                    
                    if let snapshot = snapshot {
                        
                        data = snapshot.documents.map { (document) in
                            
                            let category = document["category"] as? String ?? ""
                            let createdAt = document["createdAt"] as? Double ?? 0.0
                            let read = document["read"] as? Int ?? 0
                            let tag = document["tag"] as? [String] ?? []
                            let title = document["title"] as? String ?? ""
                            
                            return News(id: document.documentID, category: category, createdAt: createdAt, read: read ,tag: tag, title: title)
                        }
                        
                        completion(data)
                    }
                } else {
                    
                    print("Error loading news")
                }
            }
        }
    }
    
    static func getCoverImage(ref: StorageReference, completion: @escaping (Data) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
                
                if let error = error {
                    
                    print("Error loading data. \(error)")
                }
                
                guard let data = data
                        
                else {
                    
                    print("No image in cover")
                    return
                }
                
                completion(data)
            }
        }
    }
    
    static func getContentsImage(ref: StorageReference, num: Int, completion: @escaping (Data) -> Void) {
        
        DispatchQueue.global(qos: .default).async {
            
            let imageRef = ref.child("contents_\(num).png")
            
            imageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                
                if let error = error {
                    
                    print(error)
                }
                
                guard let data = data
                
                else {
                    print("error loading Image.")
                    return
                }
                
                completion(data)
            }
        }
    }
}
