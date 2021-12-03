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
    
    let news: News = News(id: "AqSKP8kD9PWMQMkYGxsz", category: "브랜드", createdAt: 1638007245, tag: ["라프시몬스","프라다"], title: "라프시몬스 x 프라다")
}
