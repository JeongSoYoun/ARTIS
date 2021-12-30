//
//  MainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/03.
//

import SwiftUI

struct MediaImageView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject var vm: ImageViewModel
    @State private var isContentShow: Bool = false
    @State private var isBookmarkTouch: Bool = false
    @State private var isHearttouch: Bool = false
    
    private let showsTitle: Bool
    private let isCustomImage: Bool
    private let media: Media
    
    init(media: Media, showsTitle: Bool = false, isCustomImage: Bool = false) {
        
        _vm = StateObject(wrappedValue: ImageViewModel(media: media))
        self.media = media
        self.showsTitle = showsTitle
        self.isCustomImage = isCustomImage
    }
    
    var body: some View {
        
        if let image = vm.coverImage {
            
            ZStack(alignment: .bottom) {
                
                Image(uiImage: image)
                    .resizable()
                    
                    .cornerRadius(isCustomImage ? 0 : 20)
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
                    
                    ZStack(alignment: .bottom){
                        
                        Rectangle()
                            .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                            .opacity(0.2)
                            .background(.ultraThinMaterial)
                            .overlay(
                            
                                HStack {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(media.title)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                                                                            
                                        Text(media.category)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Image(systemName: isHearttouch ? "heart.fill" : "heart")
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                isHearttouch.toggle()
                                            }
                                        
                                        Image(systemName: isBookmarkTouch ? "bookmark.fill" : "bookmark")
                                            .onTapGesture {
                                                isBookmarkTouch.toggle()
                                            }
                                    }
                                    .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                                    .padding()
                                }
                                    .padding()
                                
                                
                                ,alignment: .leading
                            )
                            .frame(
                                width: UIScreen.main.bounds.width,
                                height: 100
                            )
                        
                        ZStack(alignment: .topLeading) {
                            
                            Rectangle()
                                .frame(
                                    width: UIScreen.main.bounds.width,
                                    height: 120
                                )
                                .foregroundColor(Color.clear)
                            
                            HomeHeaderView()
                                .padding(.horizontal)
                        }
                    }
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
        
        MediaImageView(media: dev.news, showsTitle: true, isCustomImage: true)
    }
}
