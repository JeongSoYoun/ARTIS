//
//  gestureTest.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/07.
//

import SwiftUI

struct gestureTest: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
                .foregroundColor(.blue)
                .offset(CGSize(width: 0, height: getMinHeight()))
                .scaleEffect(getOffset())
                .gesture (
                    
                    DragGesture()
                        .onChanged { value in
                            
                            withAnimation(.default) {
                                
                                self.offset = value.translation
                            }
                        }
                        .onEnded({ _ in
                            
                            if offset.height > 100 {
                                
                                offset.height += UIScreen.main.bounds.height
                            } else {
                                
                                self.offset = .zero
                            }
                        })
                )
            
            VStack {
                
                Text("\(offset.height)")
                    .foregroundColor(.black)
                
                Text("\(UIScreen.main.bounds.height/2)")
                    .foregroundColor(.black)
                
                Text("\(getOffset())")
                    .foregroundColor(.black)
            }
        }
    }
    
    func getMinHeight() -> CGFloat {

        if offset.height <= 0 {
            
            return 0 // stay
        }
        
        return self.offset.height
    }
    
    func getOffset() -> CGFloat {
        
        let max = UIScreen.main.bounds.height
        let currentOffset = offset.height
        let percentage = (currentOffset/max)
        
        return 1.0 - (percentage) * 0.1
    }
}

struct gestureTest_Previews: PreviewProvider {
    static var previews: some View {
        gestureTest()
    }
}
