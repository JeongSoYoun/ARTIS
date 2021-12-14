//
//  testView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/11/30.
//

import SwiftUI

struct testView: View {
    
    @State private var offset: CGFloat = .zero
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach(1...10, id: \.self) { _ in
                    
                    GeometryReader { proxy in
                        
                        let scale = getScale(proxy: proxy)
                        ZStack {
                        
                            Rectangle()
                                .cornerRadius(20)
                                .scaleEffect(.init(width: scale, height: scale))
                            
                            VStack {
                                
                                Text("\(getScale(proxy:proxy))")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                Text("\(UIScreen.main.bounds.width/2)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height/2.2)
                    .padding()
                }
            }
            .padding()
        }
    }
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        
        let midPoint:CGFloat = UIScreen.main.bounds.width/2
        let deltaXAnimationThreshold: CGFloat = UIScreen.main.bounds.width/2
        let frame = proxy.frame(in: .global)
        let diffFromCenter = abs(midPoint - frame.origin.x - deltaXAnimationThreshold/2)
        
        var scale: CGFloat = 1.0
        if diffFromCenter < deltaXAnimationThreshold {
            
            scale = 1 + (deltaXAnimationThreshold-diffFromCenter)/1000
        }
        
        return scale
    }
}

struct testView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        testView()
    }
}
