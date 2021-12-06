//
//  offsetTest.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/06.
//

import SwiftUI
import UIKit

enum direction {
    
    case forward
    case backward
    case none
}

struct offsetTest: View {
    
    @State private var offset: CGPoint = .zero
    @State private var forward: Bool = false
    @State private var backward: Bool = false
    @State private var direction: direction = .none
    private let width: CGFloat = UIScreen.main.bounds.width
   
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Color.black
                .ignoresSafeArea()
                .gesture(
                    
                    DragGesture(minimumDistance: 0)
                        .onEnded { value in
                            
                            self.offset = value.location
                            
                            if offset.x >= width/2 {
                                
                                self.direction = .forward
                            } else {
                                
                                self.direction = .backward
                            }
                        }
                )
            
            VStack {
                
                Text("\(UIScreen.main.bounds.width/2)")
                    .foregroundColor(Color.white)
                Text("\(offset.x)")
                    .foregroundColor(Color.white)
                    .padding()
                
                switch direction {
                    
                case .forward:
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.red)
                        .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.height/2)
                    
                case .backward:
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.blue)
                        .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.height/2)
                    
                default:
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.height/2)
                }
            }
        }
    }
}

struct offsetTest_Previews: PreviewProvider {
    
    static var previews: some View {
    
        offsetTest()
    }
}
