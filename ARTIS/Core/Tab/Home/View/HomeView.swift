
// Home View

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    @State private var selected: String = "발매정보"
    @Namespace var animation
    
    var body: some View {
          
        NavigationView {
            
            ScrollView {
                
                VStack {
    
                    headerView
                    
                    itemBarView
                    
                    PageView()
                    
                    latestNewsView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            
            HomeView()
                .navigationBarHidden(true)
        }
        .preferredColorScheme(.light)
    }
}

extension HomeView {
    
    private var headerView: some View {
        
        HStack {
            
            Text("인사이트")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            alarmView(imageName: "bell")
                .padding(.trailing)
        }
        .padding()
        .padding(.top,20)
    }
    
    private var itemBarView: some View {
        
        ZStack(alignment: .bottom) {
            
            HStack {
                
                ItemBarView(selectedItem: $selected, item: "발매정보", animation: animation)
                ItemBarView(selectedItem: $selected, item: "브랜드", animation: animation)
                ItemBarView(selectedItem: $selected, item: "전시회", animation: animation)
            }
            
            Rectangle()
                .fill(Color.theme.SubText.opacity(0.2))
                .frame(height:2)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func PageView() -> some View {
        
        if !vm.main_news.isEmpty {
            
            switch selected {
                
            case "발매정보":
                
                TabView {
                    
                    ForEach(vm.main_news) { (news) in
                        
                        if news.category == selected {
                            
                            MainNewsImageView(news: news)
                        }
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.width/1.5, minHeight: UIScreen.main.bounds.width/1.5)
                .tabViewStyle(PageTabViewStyle())
                .padding()
                
            case "브랜드":
                
                TabView {
                    
                    ForEach(vm.main_news) { (news) in
                        
                        if news.category == selected {
                            
                            MainNewsImageView(news: news)
                        }
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.width/1.5, minHeight: UIScreen.main.bounds.width/1.5)
                .tabViewStyle(PageTabViewStyle())
                .padding()
                
            default:
                
                TabView {
                    
                    ForEach(vm.main_news) { (news) in
                        
                        if news.category == selected {
                            
                            MainNewsImageView(news: news)
                        }
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.width/1.5, minHeight: UIScreen.main.bounds.width/1.5)
                .tabViewStyle(PageTabViewStyle())
                .padding()
            }
            
        } else {
            
            ProgressView()
        }
    }
    
    @ViewBuilder
    private func latestNewsView() -> some View {
        
        if !vm.all_news.isEmpty {
            
            HStack {
                
                Text("새로운 소식")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                
                Spacer()
            }
            .padding()
            
            LazyVStack(spacing: 5) {
                
                ForEach(vm.all_news) { news in
                    
                    LatestNewsView(news: news)
                }
            }
        }
    }
}

    // return CarouselView(itemHeight: 200, views: vm.AnyViewList, title: vm.titleList)
