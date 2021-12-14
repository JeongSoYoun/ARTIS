//
//  CustomCarouselSnapView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/13.
//

import SwiftUI

struct CustomCarouselSnapView: View {
    
    private let items: [News]
    
    init(items: [News]) {
        
        self.items = items
    }
    
    var body: some View {
        
        ForEach(items) { (item) in
            
            GeometryReader { (proxy) in
                
                MainNewsImageView(news: item)
            }
            .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.height/2.5)
        }
    }
}

struct CustomCarouselSnapView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCarouselSnapView(items: dev.homeVM.all_news)
    }
}
