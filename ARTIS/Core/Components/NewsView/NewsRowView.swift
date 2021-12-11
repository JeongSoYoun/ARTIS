//
//  LatestNewsView.swift
//  LatestNewsView
//
//  Created by 정소윤 on 2021/09/29.
//

import SwiftUI

struct NewsRowView: View {
    
    let news: News
    
    var body: some View {
        
        newsView
    }
}

struct LatestNewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            NewsRowView(news: dev.news)
                .previewLayout(.sizeThatFits)
            
            NewsRowView(news: dev.news)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension NewsRowView {
    
    private var newsView: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.width/3.5)
                .foregroundColor(Color.theme.background)
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text(news.category)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.accent)
                            
                            HStack {
                                
                                Text(Date(timeIntervalSince1970: news.createdAt).format)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.theme.accent)
                                
                                HStack {
                                    Image(systemName: "eye")
                                        .font(.caption)
                                        .foregroundColor(Color.theme.accent)
                                    
                                    Text(String(news.read))
                                        .font(.caption)
                                        .foregroundColor(Color.theme.accent)
                                    
                                }.padding(.horizontal,5)
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        Text(news.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.accent)
                            .padding(.bottom)
                    }
                    .padding(.top,10)
                    
                    VStack {
                        
                        Spacer()
                        
                        NewsImageView(news: news)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal,10)
                .frame(maxWidth: UIScreen.main.bounds.width - 30,maxHeight: UIScreen.main.bounds.width/3.5)
            }
        }
    }
}
