//
//  NewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/12.
//

import SwiftUI

struct NewsCollectionRowView: View {
    
    private let news: [Media]
    @State private var selection: String? = nil
    
    init(news: [Media]) {
        
        self.news = news
    }
    
    var body: some View {
        
        VStack {
            
            ForEach(0 ..< news.count, id: \.self) { (index) in
                
                NewsRowView(news: news[index])
                    .onTapGesture {
                        self.selection = news[index].id
                    }
                    .background(
                        
                        NavigationLink(tag: news[index].id, selection: $selection, destination: {
                            ContentsView(media: news[index])
                        }, label: {
                            EmptyView()
                        })
                        
                    )
            }
        }
    }
}

