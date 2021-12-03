//
//  NewsDataService.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/11/30.
//

import Foundation
import Firebase

enum ErrorType: Error {
    
    case unknown
    
    case noData
    
    var discription: String? {
        
        switch self {
            
        case .unknown: return "Error occured"
            
        case .noData: return "No Data in Firestore"
        }
    }
}

class NewsDataService {
    
    @Published var all_news: [News] = []
    @Published var main_news: [News] = []
    
    private let collections: [String] = ["launch","brand","exhibition"]
    
    init() {
        
        downloadNews()
    }
    
    private func downloadNews() {
        
        getMainNews()
        getAllCategoryNews()
    }
    
    private func getAllCategoryNews() {
        
        let db = Firestore.firestore()
        for collection in collections {
            
            var data = [News]()
            
            db.collection(collection).getDocuments { snapshot, error in
                
                if error == nil {
                    
                    if let snapshot = snapshot {
                        
                        data = snapshot.documents.map { (document) in
                            
                            let category = document["category"] as? String ?? ""
                            let createdAt = document["createdAt"] as? Double ?? 0.0
                            let tag = document["tag"] as? [String] ?? []
                            let title = document["title"] as? String ?? ""
                            
                            return News(id: document.documentID, category: category, createdAt: createdAt, tag: tag, title: title)
                        }
                        
                        self.all_news.append(contentsOf: data)
                    }
                }
            }
        }
    }
    
    private func getMainNews() {
        
        let db = Firestore.firestore()
        
        db.collection("main").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    self.main_news = snapshot.documents.map { (document) in
                        
                        let category = document["category"] as? String ?? ""
                        let createdAt = document["createdAt"] as? Double ?? 0.0
                        let tag = document["tag"] as? [String] ?? []
                        let title = document["title"] as? String ?? ""
                        
                        return News(id: document.documentID, category: category, createdAt: createdAt, tag: tag, title: title)
                    }
                }
            }
        }
    }
}
