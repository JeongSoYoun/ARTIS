//
//  CardMegazineView.swift
//  CardMegazineView
//
//  Created by 정소윤 on 2021/10/01.
//

import SwiftUI

struct CardMegazineView: View {
    
    @State var megazines: [megazineModel]
    @State var scrolled: Int = 0
    
    var body: some View {
        
        cardMegazine
    }
}

struct CardMegazineView_Previews: PreviewProvider {
    
    static var previews: some View {
       
        ZStack {
            
            CardMegazineView(megazines: megazine_dev.megazines)
        }
    }
}

extension CardMegazineView {
    
    private var cardMegazine: some View {
        
        ForEach(megazines.reversed()) { megazine in
            
            HStack {
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    
                    Image(megazine.image)
                        .resizable()
                        .frame(width: calculatedWidth(), height: calculatedHeight() - CGFloat((megazine.id-scrolled) * 50))
                        .cornerRadius(20)
                        .offset(x: (megazine.id-scrolled) <= 2 ? CGFloat((megazine.id-scrolled) * 30) : 60)
                    
                    ZStack(alignment: .leading) {
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.width/2)
                            .foregroundColor(Color.black.opacity(0.5))
                            .blur(radius: 20)
                        
                        Text(megazine.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: calculatedWidth())
                    .padding(.horizontal,5)
                }
                
                Spacer(minLength: 0)
            }
            .contentShape(Rectangle())
            .offset(x: megazine.offset)
            .padding(.horizontal,25)
            .gesture(DragGesture().onChanged({ (value) in
                
                withAnimation {
                    
                    if value.translation.width < 0 && megazine.id != megazines.last!.id {
                        
                        megazines[megazine.id].offset = value.translation.width
                    } else {
                        
                        if megazine.id > 0 {
                            
                            megazines[megazine.id - 1].offset = -(calculatedWidth() + 60) + value.translation.width
                        }
                    }
                }
                
            }).onEnded({ (value) in
                
                withAnimation {
                    
                    if value.translation.width < 0 {
                        
                        //when completing left swipe..
                        
                        if -value.translation.width > 180 && megazine.id != megazines.last!.id {
                            
                            megazines[megazine.id].offset = -(calculatedWidth() + 60)
                            scrolled += 1
                            
                        } else {
                            
                            megazines[megazine.id].offset = 0
                        }
                    } else {
                        
                        //when completing right swipe..
                        
                        if megazine.id > 0 {
                            
                            if value.translation.width > 180 {
                                
                                megazines[megazine.id - 1].offset = 0
                                scrolled -= 1
                                
                            } else {
                                
                                megazines[megazine.id - 1].offset = -(calculatedWidth() + 60)
                            }
                        }
                    }
                }
            }))
        }
    }
    private func calculatedWidth() -> CGFloat {
        
        let screenWidth = UIScreen.main.bounds.width - 30
        let width = screenWidth - (2*32)
        
        return width
    }
    
    private func calculatedHeight() -> CGFloat {
        
        let screenHeight = UIScreen.main.bounds.height
        
        return screenHeight/2
    }
}
