//
//  testImageView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/04.
//

import SwiftUI

struct testImageView: View {
    
    @StateObject var vm: NewsImageViewModel
    
    init(news: News) {
        
        _vm = StateObject(wrappedValue: NewsImageViewModel(news: news))
    }
    
    var body: some View {
        
        HStack {
            
            if let image = vm.contentsImages  {
                
                VStack {
                    
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                        
                            Text("Test")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        )
                }
                
            } else if vm.isContentsLoading {
                
                ProgressView()
                
            } else {
                
                Image(systemName: "questionMark")
                    .foregroundColor(Color.theme.accent)
            }
        }
        .task {
            
            await vm.downloadContentsImage(1)
        }
    }
}

struct testImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        testImageView(news: dev.news)
    }
}
