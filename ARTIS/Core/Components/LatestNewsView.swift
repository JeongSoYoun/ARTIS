//
//  LatestNewsView.swift
//  LatestNewsView
//
//  Created by 정소윤 on 2021/09/29.
//

import SwiftUI

struct LatestNewsView: View {
    
    let newsModel: News
    
    var body: some View {
        
        newsView
    }
}

struct LatestNewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            LatestNewsView(newsModel: News(image_name: "peace", title: "피스마이너스원", subject:"발매 정보"))
                .previewLayout(.sizeThatFits)
            
            LatestNewsView(newsModel: News(image_name: "peace", title: "피스마이너스원", subject:"발매 정보"))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension LatestNewsView {
    
    private var newsView: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.width/3.5)
                .foregroundColor(Color.theme.background)
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing:10) {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text(newsModel.subject)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.accent)
                            
                            HStack {
                                
                                Text("2021-09-30")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.theme.accent)
                                
                                HStack {
                                    Image(systemName: "eye")
                                        .font(.caption)
                                        .foregroundColor(Color.theme.accent)
                                    
                                    Text("20")
                                        .font(.caption)
                                        .foregroundColor(Color.theme.accent)
                                    
                                }.padding(.horizontal,5)
                                
                                Spacer()
                            }
                        }
                        
                        Text(newsModel.title)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(Color.theme.SubText)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    VStack {
                        
                        Spacer()
                        
                        Image(newsModel.image_name)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.width/5)
                            .cornerRadius(10)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal,10)
                .frame(maxWidth: UIScreen.main.bounds.width - 30,maxHeight: UIScreen.main.bounds.width/3.5)
            }
        }
    }
}
