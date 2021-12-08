//
//  testImageView.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/04.
//

import SwiftUI

struct contentsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm: NewsImageViewModel
    @State private var touch_loc: CGPoint = .zero
    @State private var contents_num: Int = 1
    @State private var offset: CGSize = .zero
    @State private var isTitleShow: Bool = false
    
    private let news: News
    private let screen_width: CGFloat = UIScreen.main.bounds.width/2
    
    init(news: News) {
        
        self.news = news
        _vm = StateObject(wrappedValue: NewsImageViewModel(news: news, cache_dir: "contents"))
    }
    
    var body: some View {
        
        if contents_num <= news.contents {
            
            ZStack {
                
                Color
                    .black
                    .ignoresSafeArea()
                    .overlay(

                        Text("ARTIS")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    )
                
                contentPageView
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)

            }

        } else {
            
            ExhibitionLastPageView(news: news, collection: "ex_info")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct testImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        contentsView(news: dev.news)
    }
}

extension contentsView {
    
    @ViewBuilder
    private var contentPageView: some View {
        
        if let image = vm.contentsImages {
            
            ZStack(alignment: .top) {
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20)
                    .overlay (
                    
                        title
                        
                        ,alignment: .leading
                    )
                    .onAppear {
                        
                        withAnimation(.spring()) {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                self.isTitleShow = true
                            }
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        //Progress View
                        ForEach(1 ... news.contents, id: \.self) { index in
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(index <= contents_num ? Color.white.opacity(0.5) : Color.gray.opacity(0.3))
                                .frame(height: 2)
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 30)
                    
                    HStack(alignment:.top) {
                        
                        if let image = vm.coverImage {
                            
                            HStack(spacing: 10) {
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width:30,height:30)
                                    .padding(.horizontal,5)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(news.title)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text(news.category)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.white)
                                }
                            }
                            
                            Spacer()
                        }
                        
                        Button {
                            
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            
                            VStack {
                                
                                HStack {
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .padding(.horizontal,20)
                                }
                                
                                Spacer()
                            }
                            .frame(maxHeight: UIScreen.main.bounds.height/20)
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 30)
                    .padding(.horizontal)
                }
                    .padding(.top,50)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .offset(CGSize(width: 0, height: getOffsetHeight()))
            .scaleEffect(getScaleAmount())
            .gesture(

                DragGesture()
                    .onChanged { value in

                        withAnimation(.default) {
                            self.offset = value.translation
                        }
                    }
                    .onEnded { value in

                        withAnimation(.easeInOut) {

                            if offset.height > 100 {

                                offset.height += UIScreen.main.bounds.height
                                presentationMode.wrappedValue.dismiss()
                                
                            } else {

                                self.offset = .zero
                            }
                        }
                    }
                
                    .exclusively(before: DragGesture(minimumDistance: 0)
                                    .onEnded { touch in
                                        
                                        self.touch_loc = touch.location
                                        touch_direction()
                                    }
                                )
            )
            
        } else if vm.isContentsLoading {
            
            ProgressView()
                .onAppear {

                    vm.downloadCoverImage()
                    vm.downloadContentsImage(contents_num)
                }
            
        } else {
            
            Image(systemName: "questionMark")
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private func touch_direction() {
        
        if contents_num > 1 {
            
            if touch_loc.x >= screen_width {
                
                self.contents_num += 1
                
                if contents_num <= news.contents {
                    
                    vm.downloadContentsImage(contents_num)
                }
            } else {
                
                self.contents_num -= 1
                vm.downloadContentsImage(contents_num)
            }
        } else { // begin of contents
            
            if touch_loc.x >= screen_width {
                
                self.contents_num += 1
                vm.downloadContentsImage(contents_num)
            }
        }
    }
    
    private func getOffsetHeight() -> CGFloat {

        if offset.height <= 0 {
            
            return 0
        }
        
        return offset.height
    }
    
    private func getScaleAmount() -> CGFloat {
        
        let max = UIScreen.main.bounds.height/2
        let currentOffset = offset.height
        let percentage = (currentOffset/max)
        
        return 1.0 - (percentage) * 0.2
    }
    
    @ViewBuilder
    private var title: some View {
        
        if contents_num == 1 {
            
            VStack(alignment: .trailing, spacing: 0) {
                
                Text(news.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(isTitleShow ? 1.0 : 0.0)
                
                HStack {
                    
                    Image(systemName: "eye")
                        .foregroundColor(.white)
                        .opacity(isTitleShow ? 1.0 : 0.0)
                    
                    Text("\(news.read)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(isTitleShow ? 1.0 : 0.0)
                }
            }
            .transition(.move(edge:.bottom))
            .animation(.easeInOut,value: UUID())
            .padding(.horizontal)
        }
    }
}




