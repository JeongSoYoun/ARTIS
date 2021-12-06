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
                            let contents = document["contents"] as? Int ?? 0
                            let createdAt = document["createdAt"] as? Double ?? 0.0
                            let read = document["read"] as? Int ?? 0
                            let tag = document["tag"] as? [String] ?? []
                            let title = document["title"] as? String ?? ""
                            
                            return News(id: document.documentID, category: category, contents: contents, createdAt: createdAt, read: read ,tag: tag, title: title)
                        }
                        
                        completion(data)
                    }
                } else {
                    
                    print("Error loading news")
                }
            }
        }
    }
    
    static func downloadInfoData(ref: DocumentReference, completion: @escaping (ExhibionInfo) -> Void) {
        
        var data: ExhibionInfo? = nil
        
        DispatchQueue.global(qos: .default).async {
            
            ref.getDocument { document, error in
                
                if error == nil {
                    
                    if let document = document, document.exists {
                
                        let artist = document["artist"] as? String ?? ""
                        let isProgress = document["isProgress"] as? Bool ?? false
                        let location = document["location"] as? String ?? ""
                        let period = document["period"] as? [String:Double] ?? ["":0.0]
                        let review = document["review"] as? [String:String] ?? ["":""]
                        let score = document["score"] as? Double ?? 0.0 
                        let sns = document["sns"] as? String ?? ""
                        let title = document["title"] as? String ?? ""
                        
                        data = ExhibionInfo(id: document.documentID, artist: artist, isProgress: isProgress, location: location, period: period, review: review, score: score, sns: sns, title: title)
                    }
                    
                    if let data = data {
                        
                        completion(data)
                    } else {
                        
                        print("no data in document")
                    }
                    
                } else {
                    
                    print("error downloading data")
                }
            }
        }
    }
    
    static func downloadCoverImage(ref: StorageReference, completion: @escaping (Data) -> Void) {
        
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
    
    static func downloadContentsImage(ref: StorageReference, num: Int, completion: @escaping (Data) -> Void) {
        
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
