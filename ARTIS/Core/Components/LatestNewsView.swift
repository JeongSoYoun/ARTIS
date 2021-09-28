//
//  LatestNewsView.swift
//  LatestNewsView
//
//  Created by 정소윤 on 2021/09/29.
//

import SwiftUI

struct LatestNewsView: View {
    
    let newsModel: NewsModel
    @State var isSaving: Bool = false
    
    var body: some View {
        
        VStack {
            
            
            newsImageView
            
            infoView
        }
    }
}

struct LatestNewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            LatestNewsView(newsModel: NewsModel(image_name: "peace", title: "피스마이너스원", subject:"발매 정보"))
                .previewLayout(.sizeThatFits)
            
            LatestNewsView(newsModel: NewsModel(image_name: "peace", title: "피스마이너스원", subject: "발매 정보"))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension LatestNewsView {
    
    private var newsImageView: some View {
        
        Image(newsModel.image_name)
            .resizable()
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width/1.5)
            .cornerRadius(20)
    }
    
    private var infoView: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text("2021-09-29")
                    .font(.footnote)
                    .foregroundColor(Color.theme.SubText)
                
                Text(newsModel.subject)
                    .font(.footnote)
                    .foregroundColor(Color.theme.SubText)
                
                Spacer()
            }
            
            HStack(alignment:.bottom) {
                
                Text(newsModel.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                    .padding(.top,1)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                    }

                    Button(action: {
                        
                        withAnimation{isSaving.toggle()}
                    }) {
                        
                        if isSaving {
                            
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(Color.theme.MainColor)
                        } else {
                            
                            Image(systemName: "bookmark")
                        }
                    }
                }
            }
            .padding(.bottom)
            
            Divider()
        }
        .padding(.top,10)
        .padding(.horizontal)
    }
}
