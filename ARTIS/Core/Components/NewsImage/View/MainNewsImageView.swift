//
//  MainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/03.
//

import SwiftUI

struct MainNewsImageView: View {
    
    @StateObject var vm: NewsImageViewModel
    @State private var isContentShow: Bool = false
    private var newsTitle: String
    private let news: News
    init(news: News) {
        
        _vm = StateObject(wrappedValue: NewsImageViewModel(news: news))
        self.newsTitle = news.title
        self.news = news
    }
    
    var body: some View {
        
        if let image = vm.coverImage {
            
            ZStack(alignment: .bottomTrailing) {
                
                Image(uiImage: image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.height/3)
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        
                        Color.black.opacity(0.3)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .onTapGesture {
                        self.isContentShow = true
                    }
                    .background(
                        NavigationLink(isActive: $isContentShow, destination: {
                            
                            ContentsView(news: news, of: news.category)
                        }, label: {
                            EmptyView()
                        })
                    )
                
                Text(newsTitle)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.bottom,30)
            }
            .padding(.top)
            
        } else if vm.isLoading {
            
            ProgressView()
        } else {
            
            Image(systemName: "questionMark")
                .foregroundColor(Color.theme.TextColor)
        }
    }
}

struct MainNewsView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainNewsImageView(news: dev.news)
    }
}
