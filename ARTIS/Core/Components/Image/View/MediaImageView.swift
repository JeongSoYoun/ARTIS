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
    
    private let showsTitle: Bool
    private let media: Media
    
    init(media: Media, showsTitle: Bool = false) {
        
        _vm = StateObject(wrappedValue: ImageViewModel(media: media))
        self.media = media
        self.showsTitle = showsTitle
    }
    
    var body: some View {
        
        if let image = vm.coverImage {
            
            ZStack(alignment: .bottom) {
                
                Image(uiImage: image)
                    .resizable()
                    
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
                
                if showsTitle {
                    
                    Rectangle()
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: 120
                        )
                        .foregroundColor(Color.black)
                        .opacity(0.2)
                        .background(.ultraThinMaterial)
                        .CustomCornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        .overlay(
                        
                            VStack {
                                
                                Text(media.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding()
                                                                    
                                Text(media.category)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                            
                            ,alignment: .center
                        )
                }
            }
            
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
        
        MediaImageView(media: dev.news, showsTitle: true)
    }
}
