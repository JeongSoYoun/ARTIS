//
//  tabTest.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/07.
//

import SwiftUI

struct tabTest: View {
    
    @State var isTapping_1: Bool = false
    @State var isTapping_2: Bool = false
    
    var body: some View {
        
        ZStack {
            
            let tap_1 = TapGesture()
            let tap_2 = TapGesture()
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.blue)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: UIScreen.main.bounds.height/2)
                    .gesture(
                             
                        tap_1.onEnded { _ in
                            
                            self.isTapping_1 = true
                            self.isTapping_2 = false
                        }
                            .exclusively(before: tap_2.onEnded { _ in
                                        
                                                    self.isTapping_1 = false
                                                    self.isTapping_2 = true
                                                 }
                                        )
                    )
            }
            .gesture(
            
                tap_2.onEnded { _ in
                    self.isTapping_2 = true
                }
            )
            
            
            VStack {
                Text("tapping_1")
                    .foregroundColor(.white)
                Text("\(isTapping_1.description)")
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Text("tapping_2")
                    .foregroundColor(.white)
                Text("\(isTapping_2.description)")
                    .foregroundColor(.white)
            }
        }
    }
}

struct tabTest_Previews: PreviewProvider {
    static var previews: some View {
        tabTest()
    }
}


