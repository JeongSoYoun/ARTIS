//
//  MainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/03.
//

import SwiftUI

struct MainNewsImageView: View {
    
    @StateObject var vm: NewsImageViewModel
    private var newsTitle: String
    
    init(news: News) {
        
        _vm = StateObject(wrappedValue: NewsImageViewModel(news: news))
        self.newsTitle = news.title
    }
    
    var body: some View {
        
        if let image = vm.coverImage {
            
            VStack(spacing: 10) {
                
                Text(newsTitle)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
        } else if vm.isLoading {
            
            ProgressView()
        } else {
            
            Image(systemName: "questionMark")
                .foregroundColor(Color.theme.accent)
        }
    }
}

struct MainNewsView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainNewsImageView(news: dev.news)
    }
}
