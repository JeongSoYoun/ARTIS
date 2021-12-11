//
//  testView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/11/30.
//

import SwiftUI

struct testView: View {
    
    @State private var isShow: Bool = false
    @Namespace var namespace
    
    var body: some View {
        
        VStack {
            
            if !isShow {
                
                Rectangle()
                    .cornerRadius(20)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isShow.toggle()
                        }
                    }
                
            } else {
                
                Rectangle()
                    .cornerRadius(20)
                    .matchedGeometryEffect(id: "tri", in: namespace)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isShow.toggle()
                        }
                    }
            }
        }
        .onAppear {
            
        }
    }
}

struct testView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        testView()
    }
}
