//
//  HomeCarousel.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/13.
//

import SwiftUI

struct HomeCarousel: View {
    
    private let media: [Media]
    
    init(media: [Media]) {
        
        self.media = media
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 10) {
                
                ForEach(media) { news in
                    
                    GeometryReader { proxy in
                        
                        let scale = getScale(proxy: proxy)
                        MainNewsImageView(news: news)
                            .scaleEffect(.init(width: scale, height: scale))
                    }
                    .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.height/2.5)
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                }
            }
        }
        .padding(.horizontal)
    }
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        
        let width: CGFloat = UIScreen.main.bounds.width/2
        let midPoint: CGFloat = width
        let deltaX: CGFloat = width
        let frame: CGRect = proxy.frame(in: .global)
        
        let diffFromCenter = abs(midPoint - frame.origin.x - deltaX/2)
        
        var scale: CGFloat = 1.0
        if diffFromCenter < deltaX {
            
            scale = 1 + (deltaX-diffFromCenter)/2000
        }
        
        return scale
    }
}

struct HomeCarousel_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
    }
}
