//
//  PreviewProvider.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/11/30.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static var instance: DeveloperPreview = DeveloperPreview()
    private init() {}
    
    let homeVM: HomeViewModel = HomeViewModel()
    
    let news: Media = Media(id: "TryWcXnqhQG4IgNjl8pL", category: "전시회", contents: 3, createdAt: 1638258792, tag: ["식물관 PH"], title: "Artificial Plants")
    
    let sample_news: [Media] = [
        Media(id: "TryWcXnqhQG4IgNjl8pL", category: "전시회", contents: 3, createdAt: 1638258792, tag: ["식물관 PH"], title: "Artificial Plants"),
        Media(id: "AqSKP8kD9PWMQMkYGxsz", category: "브랜드", contents: 3, createdAt: 1638007245, tag: ["라프시몬스"], title: "라프시몬스 x 프라다"),
        Media(id: "VmHX885KiT5O85Ke569a", category: "발매정보", contents: 3, createdAt: 1638258792, tag: ["지디"], title: "지드래곤 x 에어포스 1")
    ]
}
