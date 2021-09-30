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
        
        newsView
    }
}

struct LatestNewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            LatestNewsView(newsModel: NewsModel(image_name: "peace", title: "피스마이너스원", subject:"발매 정보"))
                .previewLayout(.sizeThatFits)
            
            LatestNewsView(newsModel: NewsModel(image_name: "peace", title: "피스마이너스원", subject:"발매 정보"))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension LatestNewsView {
    
    private var newsView: some View {
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.width/2)
                .foregroundColor(Color.theme.newsColor)
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading,spacing:10) {
                        
                        Text(newsModel.subject)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.theme.SubText)
                        
                        Text(newsModel.title)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    Image(newsModel.image_name)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                        .cornerRadius(10)
                }
                .padding(.horizontal,10)
                .frame(maxWidth: UIScreen.main.bounds.width - 30)
                
                Divider()
                    .frame(maxWidth: UIScreen.main.bounds.width-30)
                HStack {
                    
                    Text("2021-09-30")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.SubText)
                    
                    HStack {
                        Image(systemName: "eye")
                            .font(.footnote)
                            .foregroundColor(Color.theme.SubText)
                        
                        Text("20")
                            .font(.footnote)
                            .foregroundColor(Color.theme.SubText)
                        
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: UIScreen.main.bounds.width - 30)
            }
            .frame(maxHeight: UIScreen.main.bounds.width/2)
        }
    }
}
