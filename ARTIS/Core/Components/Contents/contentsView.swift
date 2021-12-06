//
//  testImageView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/04.
//

import SwiftUI

struct contentsView: View {
    
    @StateObject var vm: NewsImageViewModel
    @State private var touch_loc: CGPoint = .zero
    @State private var content_num: Int = 1
    
    private let news: News
    
    private let screen_width: CGFloat = UIScreen.main.bounds.width
    
    init(news: News) {
        
        self.news = news
        _vm = StateObject(wrappedValue: NewsImageViewModel(news: news))
    }
    
    var body: some View {
        
        if content_num <= news.contents {
            
            contentPageView

        } else {
            
            ExhibitionLastPageView(news: news, collection: "ex_info")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct testImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        contentsView(news: dev.news)
    }
}

extension contentsView {
    
    private var contentPageView: some View {
        
        HStack {
            
            if let image = vm.contentsImages  {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .gesture(
                        
                        DragGesture(minimumDistance: 0)
                            .onEnded { value in
                                
                                self.touch_loc = value.location
                                
                                if content_num > 1 {
                                    
                                    if touch_loc.x >= screen_width {
                                        
                                        self.content_num += 1
                                        vm.downloadContentsImage(content_num)
                                    } else {
                                        
                                        self.content_num -= 1
                                        vm.downloadContentsImage(content_num)
                                    }
                                } else { // begin of contents
                                    
                                    if touch_loc.x >= screen_width {
                                        
                                        self.content_num += 1
                                        vm.downloadContentsImage(content_num)
                                    }
                                }
                            }
                    )
                
            } else if vm.isContentsLoading {
                
                ProgressView()
                
            } else {
                
                Image(systemName: "questionMark")
                    .foregroundColor(Color.theme.accent)
            }
        }
        .onAppear {
            
            vm.downloadContentsImage(content_num)
        }
    }
}
