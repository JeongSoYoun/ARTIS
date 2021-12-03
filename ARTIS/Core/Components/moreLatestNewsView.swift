//
//  moreLatestNewsView.swift
//  moreLatestNewsView
//
//  Created by 정소윤 on 2021/10/02.
//

import SwiftUI

struct moreLatestNewsView: View {
    
    let allNEWS: [News]
    
    var body: some View {
        
        ScrollView {
            
            ForEach(allNEWS) { news in
                
                LatestNewsView(news: news)
            }
        }
            .navigationTitle("뉴스")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct moreLatestNewsView_Previews: PreviewProvider {
    static var previews: some View {
        
        moreLatestNewsView(allNEWS: [dev.news])
    }
}
