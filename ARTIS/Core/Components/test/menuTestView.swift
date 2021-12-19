//
//  menuTestView.swift
//  ARTIS
//
//  Created by temp on 2021/12/18.
//

import SwiftUI

struct menuTestView: View {

    @Binding var selected: String
    @State private var currentMenu: Int = 0
    @State private var dragAmount: CGFloat = 0
    
    private let menuItem: [String] = ["발매정보","브랜드","전시회"]
    private let spacing: CGFloat = 18
    private let widthOfHiddenMenu: CGFloat = 10
    private let numberOfMenu = 3
    private let menuWidth: CGFloat
    private let totalMenuWidth: CGFloat
    private let centerOffset: CGFloat
    private let totalMovement: CGFloat
    
    init(selected: Binding<String>) {
        
        self.menuWidth = 100 - (spacing + widthOfHiddenMenu) * 2
        self.totalMenuWidth = (3 * menuWidth) + CGFloat((menuItem.count-1)) * spacing
        self.centerOffset = (totalMenuWidth - 100) / 2
        self.totalMovement = menuWidth + spacing
        
        self._selected = selected
    }
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.theme.MainColor)
                .frame(width: 100, height: 30)
            
            HStack(spacing: spacing) {
                
                ForEach(0 ..< menuItem.count, id: \.self) { index in
                    
                    Text(menuItem[index])
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.background)
                        .opacity(menuItem[index] == selected ? 1.0 : 0.8)
                        .frame(width: menuWidth)
                        .offset(x: calcOffset(), y: 0)
                        .gesture(
                        
                            DragGesture()
                                .onChanged { value in
                                    
                                    self.dragAmount = value.translation.width
                                }
                                .onEnded { value in
                                    
                                    self.dragAmount = 0
                                    if value.translation.width < -50 {
                                        
                                        if index < menuItem.count - 1 {
                                            currentMenu += 1
                                            self.selected = menuItem[currentMenu]
                                        }
                                    } else {
                                        
                                        if index > 0 {
                                            currentMenu -= 1
                                            self.selected = menuItem[currentMenu]
                                        }
                                    }
                                }
                        )
                        .animation(.spring() ,value: UUID())
                }
            }
        }.frame(maxWidth: 100)
    }
    
    private func calcOffset() -> CGFloat {
        
        let minOffset: CGFloat = centerOffset + (spacing + widthOfHiddenMenu)
        let maxOffset: CGFloat = minOffset - (totalMovement * CGFloat(menuItem.count-1))
        let currentOffset: CGFloat = minOffset - (totalMovement * CGFloat(currentMenu))
        
        var offset = currentOffset
        if offset == minOffset {
            
            offset = currentOffset + dragAmount
            return min(minOffset,offset)
        } else {
            
            offset = currentOffset + dragAmount
            return max(offset,maxOffset)
        }
    }
}

struct menuTestView_Previews: PreviewProvider {
    
    static var previews: some View {
        menuTestView(selected: .constant("발매정보"))
    }
}
