//
//  LatestNewsView.swift
//  LatestNewsView
//
//  Created by 정소윤 on 2021/09/29.
//

import SwiftUI

struct NewsRowView: View {
    
    private let news: Media
    
    init(news: Media) {
        
        self.news = news
    }
    
    var body: some View {
        
        newsView
    }
}

struct LatestNewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NewsRowView(news: dev.news)
    }
}

extension NewsRowView {
    
    private var newsView: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(news.category)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.TextColor)
                        
                        HStack {
                            
                            Text(Date(timeIntervalSince1970: news.createdAt).format)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.TextColor)
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    Text(news.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.TextColor)
                        .padding(.bottom)
                }
                .padding(.top,10)
                
                VStack {
                    
                    Spacer()
                    
                    NewsCoverImageView(news: news)
                    
                    Spacer()
                }
            }
            .padding(.horizontal,10)
            .frame(maxWidth: UIScreen.main.bounds.width - 30,maxHeight: UIScreen.main.bounds.width/3.5)
        }

    }
}
