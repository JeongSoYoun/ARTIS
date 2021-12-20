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
        
        ZStack {
            
            Rectangle()
                .frame(width: 150 , height: 50)
                .foregroundColor(Color.theme.MainColor)
                .CustomCornerRadius(10, corners: [.topRight,.bottomRight])
            
            HStack(alignment: .bottom, spacing: 5) {
                
                Text("Trending")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.background)
                
                AnimatedImage(name:"fire.gif")
                    .resizable()
                    .frame(width: 20, height: 30)
            }
        }
    }
}

struct menuTestView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            HomeHeaderView()
                .previewLayout(.sizeThatFits)
            
            HomeHeaderView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
