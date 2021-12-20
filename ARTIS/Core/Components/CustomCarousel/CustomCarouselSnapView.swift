//
//  CustomCarouselSnapView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/13.
//

import SwiftUI

struct CustomCarouselSnapView: View {
    
    @State private var currentItem: Int = 0
    @State private var dragAmount: CGFloat = 0
    
    private let media: [Media]
    private let showsIndicators: Bool
    private let showsTitle: Bool
    private let spacing: CGFloat
    private let widthOfHiddenCard: CGFloat
    private let numberOfMedia: CGFloat
    private let totalSpacing: CGFloat
    private let cardWidth: CGFloat
    private let totalCardWidth: CGFloat
    private let xOffsetToShift: CGFloat
    private let leftPadding: CGFloat
    private let totalMovement: CGFloat
    
    init(media: [Media], spacing: CGFloat, widthOfHiddenCard: CGFloat, leftPadding: CGFloat, showsIndicators: Bool = true, showsTitle: Bool = true) {
        
        self.media = media
        self.showsIndicators = showsIndicators
        self.showsTitle = showsTitle
        self.spacing = spacing
        self.widthOfHiddenCard = widthOfHiddenCard
        self.numberOfMedia = CGFloat(media.count)
        self.totalSpacing = (numberOfMedia - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCard + spacing) * 2
        self.totalCardWidth = (numberOfMedia * cardWidth) + totalSpacing
        self.xOffsetToShift = (totalCardWidth - UIScreen.main.bounds.width) / 2
        self.leftPadding = leftPadding
        self.totalMovement = cardWidth + spacing
    }
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: spacing) {
                
                ForEach(0 ..< media.count, id: \.self) { (index) in
                    
                    MediaImageView(media: media[index], showsTitle: showsTitle)
                        .frame(
                            width: cardWidth,
                            height: index == currentItem ? cardWidth + 100 : cardWidth + 50
                        )
                        .opacity(index == currentItem ? 1.0 : 0.7)
                        .offset(x: calcOffset(), y: 0)
                        .gesture(
                            
                            DragGesture()
                                .onChanged { value in
                                    
                                    self.dragAmount = value.translation.width
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
                        .animation(.default, value: UUID())
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            
            if showsIndicators {
                
                HStack {
                    
                    ForEach(0 ..< media.count, id: \.self) { index in
                        
                        Circle()
                            .frame(
                                width: index == currentItem ? 8 : 6,
                                height: index == currentItem ? 8 : 6 )
                            .foregroundColor(Color.theme.TextColor)
                    }
                }
                .padding()
            }
        }
    }
    
    private func calcOffset() -> CGFloat {
        
        let minOffset: CGFloat = xOffsetToShift + leftPadding
        let maxOffset: CGFloat = minOffset - (totalMovement * CGFloat(media.count-1))
        let currentOffset: CGFloat = minOffset - (totalMovement * CGFloat(currentItem))
        
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

struct CustomCarouselSnapView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomCarouselSnapView(media: dev.sample_news, spacing: 0, widthOfHiddenCard: 0, leftPadding: 0, showsIndicators: true)
    }
}

