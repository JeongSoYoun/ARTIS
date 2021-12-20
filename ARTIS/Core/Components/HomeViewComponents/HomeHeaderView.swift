//
//  menuTestView.swift
//  ARTIS
//
//  Created by temp on 2021/12/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeHeaderView: View {

    var body: some View {
        
        ZStack(alignment: .center) {
            
            Rectangle()
                .frame(width: 150 , height: 40)
                .foregroundColor(Color.theme.MainColor)
                .cornerRadius(10)
            
            HStack(alignment: .bottom, spacing: 10) {
                
                Text("Trending")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.background)
                
                AnimatedImage(name:"fire.gif")
                    .resizable()
                    .frame(width: 25, height: 30)
            }
        }
    }
}

struct menuTestView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeHeaderView()
    }
}
