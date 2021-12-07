//
//  mainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/05.
//

import SwiftUI

struct contentsNavigationView: View {
    
    @State var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var tag: Int = 0
    private let all_news: [News]
    private let news_type: String
    
    init(all_news: [News], news_type: String) {
    
        self.all_news = all_news
        self.news_type = news_type
    }
    
    var body: some View {
        
        switch news_type {
            
        case "main":
            
            TabView(selection: $tag) {
                
                ForEach(0 ..< all_news.count) { index in
                    
                    NavigationLink {
                        contentsView(news: all_news[index])
                            
                    } label: {
                        MainNewsImageView(news: all_news[index])
                            .tag(index)
                    }
                }
            }
            .aspectRatio(CGSize(width: 1.6, height: 1.2), contentMode: .fit)
            .tabViewStyle(.page)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            .onReceive(timer) { _ in
                
                withAnimation(.easeInOut(duration: 5)) {
                    
                    tag = tag == all_news.count ? 0 : tag + 1
                }
            }
            .shadow(color: Color.theme.accent.opacity(0.3),
                    radius: 20)
            
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
