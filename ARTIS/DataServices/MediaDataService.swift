//
//  NewsDataService.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/11/30.
//

import Foundation
import Firebase

class MediaDataService {
    
    @Published var all_media: [Media] = []
    @Published var all_news: [Media] = []
    @Published var main_news: [Media] = []
    @Published var magazines: [Media] = []
    @Published var exhibionInfo: ExhibitionInfo? = nil
    @Published var launchInfo: LaunchInfo? = nil
    @Published var brandInfo: BrandInfo? = nil
    
    private let db: [String] = dbCollectionMap.dbCollection()
    
    init() {}
    
    func donwloadAllMedia() {
        
        getAllMedia()
    }
    
    func downloadNews() {
        
        getMainNews()
        getAllNews()
    }
    
    func downloadMagazines() {
        
        getMagazines()
    }
    
    private func getAllMedia() {
        
        for collection in db {
            
            NetworkManager.downloadMediaData(collection: collection) { media in
                
                self.all_media.append(contentsOf: media)
            }
        }
    }
    
    private func getAllNews() {
        
        NetworkManager.downloadMediaData(collection: "news") { news in
            
            self.all_news.append(contentsOf: news)
        }
    }
    
    private func getMainNews() {
        
        NetworkManager.downloadMediaData(collection: "main") { news in
            
            self.main_news = news
        }
    }
    
    private func getMagazines() {
        
        NetworkManager.downloadMediaData(collection: "magazine") { magazines in
            
            self.magazines = magazines
        }
    }
    
    func getInfo(_ db_collection: String, _ news: Media) {
        
        let docRef = infoRef(collection: db_collection, id: news.id)
        
        switch db_collection {
            
        case "ex_info":
            NetworkManager.downloadExhibitionInfo(ref: docRef) { info in
                self.exhibionInfo = info
            }
        case "launch_info":
            NetworkManager.downloadLaunchInfo(ref: docRef) { info in
                self.launchInfo = info
            }
        default:
            NetworkManager.downloadBrandInfo(ref: docRef) { info in
                self.brandInfo = info
            }
        }
    }
    
    private func infoRef(collection: String, id: String) -> DocumentReference {
        
        let db = Firestore.firestore().collection(collection).document(id)
        
        return db
    }
}
