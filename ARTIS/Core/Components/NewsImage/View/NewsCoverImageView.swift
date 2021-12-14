//
//  NewsImageView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/01.
//

import SwiftUI

struct NewsCoverImageView: View {
    
    @StateObject var vm: ImageViewModel
    
    init(news: Media) {
        
        _vm = StateObject(wrappedValue: ImageViewModel(media: news))
    }
    
    var body: some View {
        
        HStack {
            
            if let image = vm.coverImage {
                
                Image(uiImage: image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/5 , height: UIScreen.main.bounds.width/5)
                    .cornerRadius(20)

            } else if vm.isLoading {
                
                ProgressView()
            } else {
                
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.TextColor)
            }
        }
    }
}


struct NewsImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        NewsCoverImageView(news: dev.news)
    }
}
