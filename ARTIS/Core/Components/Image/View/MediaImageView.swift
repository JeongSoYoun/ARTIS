//
//  MainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/03.
//

import SwiftUI

struct MediaImageView: View {
    
    @StateObject var vm: ImageViewModel
    @State private var isContentShow: Bool = false
    
    private let media: Media
    
    init(media: Media) {
        
        _vm = StateObject(wrappedValue: ImageViewModel(media: media))
        self.media = media
    }
    
    var body: some View {
        
        if let image = vm.coverImage {
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(CGSize(width: 1.2, height: 1.6), contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    self.isContentShow = true
                }
                .background(
                    NavigationLink(isActive: $isContentShow, destination: {
                        ContentsView(media: media)
                    }, label: {
                        EmptyView()
                    })
                )
            
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
        
        MediaImageView(media: dev.news)
    }
}
