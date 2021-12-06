//
//  mainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/05.
//

import SwiftUI

struct contentsNavigationView: View {
    
    private let all_news: [News]
    private let news_type: String
    
    init(all_news: [News], news_type: String) {
    
        self.all_news = all_news
        self.news_type = news_type
    }
    var body: some View {
        
        switch news_type {
            
        case "main":
            
            TabView {
                
                ForEach(all_news) { (news) in
                    
                    NavigationLink {
                        contentsView(news: news)
                            .transition(.move(edge:.trailing))
                    } label: {
                        MainNewsImageView(news: news)
                    }
                }
            }
            .aspectRatio(CGSize(width: 1.6, height: 1.2), contentMode: .fit)
            .tabViewStyle(.page)
            .padding()
            
        default: // "all category news"
            
            LazyVStack(spacing: 5) {
                
                ForEach(all_news) { news in
                    
                    LatestNewsView(news: news)
                }
            }
        }
    }
}
//
//struct mainNewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        mainNewsView(mainNews: <#T##[News]#>)
//    }
//}
