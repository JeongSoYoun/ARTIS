//
//  collectionMap.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/14.
//

import Foundation

class dbCollectionMap {
    
    static func dbCollection() -> [String] {
        
        return ["launch","brand","exhibition","magazine"]
    }
    
    static func NewsCollection() -> [String] {
        
        return ["launch","brand","exhibition"]
    }
    
    static func model(collection: String) -> String {
        
        switch collection {
            
        case "발매정보":
            return "launch"
        case "브랜드":
            return "brand"
        case "전시회":
            return "exhibition"
        default:
            return "magazine"
        }
    }
    
    static func info(category: String) -> String {
        
        switch category {
            
        case "발매정보":
            return "launch_info"
        case "브랜드":
            return "brand_info"
        default:
            return "ex_info"
        }
    }
}
