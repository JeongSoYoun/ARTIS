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
    @Published var exhibionInfo: ExhibionInfo? = nil
    
    private let collections: [String] = ["launch","brand","exhibition"]
    
    init() {
        
        downloadNews()
    }
    
    private func downloadNews() {
        
        getMainNews()
        getAllNews()
    }
    
    private func getAllNews() {
        
        for collection in collections {
            
            NetworkManager.downloadNewsData(collection: collection) { news in
                
                self.all_news.append(contentsOf: news)
            }
        }
    }
    
    private func getMainNews() {
        
        NetworkManager.downloadNewsData(collection: "main") { news in
            
            self.main_news = news
        }
    }
    
    func getInfo(collection: String, news: News) {
        
        let docRef = infoRef(collection: collection, id: news.id)
        
        NetworkManager.downloadInfoData(ref: docRef) { returnedExhibionInfo in
            
            self.exhibionInfo = returnedExhibionInfo
        }
    }
    
    private func infoRef(collection: String, id: String) -> DocumentReference {
        
        let db = Firestore.firestore().collection(collection).document(id)
        
        return db
    }
}
