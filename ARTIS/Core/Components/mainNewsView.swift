//
//  mainNewsView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/05.
//

import SwiftUI

struct mainNewsView: View {
    
    private let mainNews: [News]
    
    init(mainNews: [News]) {
    
        self.mainNews = mainNews
    }
    var body: some View {
        
        TabView {
            
            ForEach(mainNews) { (news) in

                NavigationLink {
                    testImageView(news: news)
                } label: {
                    MainNewsImageView(news: news)
                }
            }
        }
        .frame(minWidth: UIScreen.main.bounds.width/1.5, minHeight: UIScreen.main.bounds.width/1.5)
        .tabViewStyle(.page)
        .padding()
    }
}
//
//struct mainNewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        mainNewsView(mainNews: <#T##[News]#>)
//    }
//}
