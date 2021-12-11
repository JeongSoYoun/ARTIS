//
//  mainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/05.
//

import SwiftUI

struct ContentsNavigationView: View {
    
    @State private var isContentShow: Bool = false
    @State private var isNewsShow: Bool = false
    @Namespace private var namespace
    
    private let news: [News]
    private let news_type: String
    
    init(all_news: [News], news_type: String) {
    
        self.news = all_news
        self.news_type = news_type
    }
    
    var body: some View {
        
        switch news_type {
            
        case "main":
            
            TabView {
                
                ForEach(0 ..< news.count, id: \.self) { index in
                    
                    MainNewsImageView(news: news[index])
                        .onTapGesture(perform: {
                            
                            self.isContentShow.toggle()
                        })
                        .background(
                            NavigationLink(isActive: $isContentShow, destination: {
                                
                                ContentsView(news: news[index], of: news[index].category)
                            }, label: {
                                EmptyView()
                            })
                        )
                        .padding(.horizontal)
                }
            }
            .tabViewStyle(.page)
            .aspectRatio(CGSize(width: 1.6, height: 1.2), contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
        default: // "all category news"
            
            LazyVStack(spacing: 5) {
                
                ForEach(0 ..< news.count, id: \.self) { index in
                    
                    NewsRowView(news: news[index])
                        .background(
                            NavigationLink(isActive: $isNewsShow, destination: {
                                
                                ContentsView(news: news[index], of: news[index].category)
                            }, label: {
                                EmptyView()
                            })
                        )
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
