//
//  testView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/11/30.
//

import SwiftUI

struct testView: View {
    
    @ObservedObject private var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Test View")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ForEach(vm.main_news) { (news) in
                    
                    HStack {
                        
                        Text(news.title)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(news.id)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(news.category)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding()
                }
            }
        }
    }
}

struct testView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        testView()
    }
}
