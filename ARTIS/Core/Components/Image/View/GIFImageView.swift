//
//  GIFImageView.swift
//  ARTIS
//
//  Created by temp on 2021/12/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct GIFImageView: View {
    
    @State var isAnimating: Bool = true
    var body: some View {
        
        HStack {
            
            AnimatedImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/artis-302a2.appspot.com/o/main%2Flaunch%2FyLKoBLXUQDNFWdiCDecd%2Fcover%2Fcover.gif?alt=media&token=65ee4156-6860-46ea-9d72-ae2fb653a16c"), isAnimating: $isAnimating)
                .resizable()
                .playbackRate(0.5)
                .cornerRadius(20)
                .aspectRatio(CGSize(width: 1.2, height: 1.6), contentMode: .fit)
                .frame(width: 300, height: 300)
        }
    }
}

struct GIFImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GIFImageView()
    }
}
