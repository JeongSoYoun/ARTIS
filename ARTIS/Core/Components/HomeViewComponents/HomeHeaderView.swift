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
                .frame(width: 120 , height: 30)
                .foregroundColor(Color.theme.MainColor)
                .cornerRadius(10)
            
            HStack(spacing: 5) {
                
                Text("Trending")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.background)
                
                AnimatedImage(name:"fire.gif")
                    .resizable()
                    .frame(width: 15, height: 17)
            }
        }
    }
}

struct menuTestView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeHeaderView()
    }
}
