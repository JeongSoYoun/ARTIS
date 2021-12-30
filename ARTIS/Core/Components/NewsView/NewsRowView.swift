//
//  LatestNewsView.swift
//  LatestNewsView
//
//  Created by 정소윤 on 2021/09/29.
//

import SwiftUI

struct NewsRowView: View {
    
    private let news: Media
    @State private var selection: String? = nil
    
    init(news: Media) {
        
        self.news = news
    }
    
    var body: some View {
        
        newsView
            .onTapGesture {
                self.selection = news.id
            }
            .background(
                
                NavigationLink(tag: news.id, selection: $selection, destination: {
                    ContentsView(media: news)
                    
                }, label: {
                    EmptyView()
                })
                
            )
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
                        
                        Text(news.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.TextColor)
                            .padding(.bottom)
                        
                        HStack {
                            
                            Text("Posted at")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.TextColor)
                            
                            Text(Date(timeIntervalSince1970: news.createdAt).format)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.TextColor)
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()

                }
                .padding(.top,10)
                
                VStack {
                    
                    Spacer()
                    
                    NewsRowCoverImageView(news: news)
                    
                    Spacer()
                }
            }
            
            .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: UIScreen.main.bounds.width/3.5)
        }
        .padding(.horizontal)
    }
}
