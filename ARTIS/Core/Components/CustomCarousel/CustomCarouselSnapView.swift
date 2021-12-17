//
//  CustomCarouselSnapView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/13.
//

import SwiftUI

struct CustomCarouselSnapView: View {
    
    @State private var currentItem: Int
    @State private var dragAmount: CGFloat = 0
    
    private let media: [Media]
    private let spacing: CGFloat = 16
    private let widthOfHiddenCard: CGFloat = 60
    private let numberOfMedia: CGFloat
    private let totalSpacing: CGFloat
    private let cardWidth: CGFloat
    private let totalCardWidth: CGFloat
    private let xOffsetToShift: CGFloat
    private let leftPadding: CGFloat
    private let totalMovement: CGFloat
    
    init(media: [Media]) {
        
        self.currentItem = media.count/2
        self.media = media
        self.numberOfMedia = CGFloat(media.count)
        self.totalSpacing = (numberOfMedia - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCard + spacing) * 2
        self.totalCardWidth = (numberOfMedia * cardWidth) + totalSpacing
        self.xOffsetToShift = (totalCardWidth - UIScreen.main.bounds.width) / 2
        self.leftPadding = widthOfHiddenCard + spacing
        self.totalMovement = cardWidth + spacing
    }
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: spacing) {
                
                ForEach(0 ..< media.count, id: \.self) { (index) in
                    
                    MediaImageView(media: media[index])
                        .frame(
                            width: cardWidth,
                            height: index == currentItem ? cardWidth + 100 : cardWidth + 50
                        )
                        .offset(x: calcOffset(), y: 0)
                        .gesture(
                            
                            DragGesture()
                                .onChanged { value in
                                    
                                    if currentItem < media.count - 1 {
                                        
                                        self.dragAmount = value.translation.width
                                    }
                                }
                                .onEnded { value in
                                    
                                    self.dragAmount = 0
                                    if value.translation.width < -30 {
                                        
                                        if currentItem < media.count - 1 {
                                            
                                            currentItem += 1
                                        }
                                    } else {
                                        
                                        if currentItem > 0 {
                                            
                                            currentItem -= 1
                                        }
                                    }
                                }
                        )
                        .transition(AnyTransition.slide)
                        .animation(.spring(), value: UUID())
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            
            Text("\(media[currentItem].title)")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.TextColor)
                .padding()
        }
    }
    
    private func calcOffset() -> CGFloat {
        
        let minOffset: CGFloat = xOffsetToShift + (leftPadding)
        let currentOffset: CGFloat = minOffset - (totalMovement * CGFloat(currentItem))
        
        var offset = currentOffset
        
        if offset == minOffset {
            
            return minOffset
        } else {
            
            offset = currentOffset + dragAmount
            return offset
        }
    }
}

struct CustomCarouselSnapView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomCarouselSnapView(media: dev.sample_news)
    }
}

