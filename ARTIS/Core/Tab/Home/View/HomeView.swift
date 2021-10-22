
// Home View

import SwiftUI

struct HomeView: View {
    
    @State var selectedItem: String = "발매 정보"
    @ObservedObject var vm: HomeViewModel
    @Namespace var animation
    
    var body: some View {
          
        NavigationView {
            
            ScrollView {
                
                VStack {
    
                    headerView
                    
                    itemBarView
                    
                    carouselView(menu: selectedItem)
                    
                    latestNewsHeader
                    
                    latestNewsView
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            
            HomeView(vm: HomeViewModel())
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
                
                ItemBarView(selectedItem: $selectedItem, item: "발매 정보", animation: animation)
                ItemBarView(selectedItem: $selectedItem, item: "브랜드", animation: animation)
                ItemBarView(selectedItem: $selectedItem, item: "전시회", animation: animation)
            }
            
            Rectangle()
                .fill(Color.theme.SubText.opacity(0.2))
                .frame(height:2)
        }
        .padding(.horizontal)
    }
    
    private var latestNewsHeader: some View {
        
        HStack {
            
            Text("최신 소식")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
            
            NavigationLink(destination: moreLatestNewsView(allNEWS: vm.all_news)){
                
                Text("더 보기")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.MainColor)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
    
    private var latestNewsView: some View {
        
        VStack(spacing:5) {
            
            ForEach(0 ..< 4) { index in
                
                LatestNewsView(newsModel: vm.all_news[index])
            }
        }
    }
    
    private func carouselView(menu: String) -> AnyView {
        
        return AnyView(CarouselView(itemHeight: 200,
                                    views: vm.viewList(menu: menu).0,
                                    title: vm.viewList(menu: menu).1)
               )
    }
}
