
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    @Namespace var animation
    @State private var selected: String = "발매정보"
    
    var body: some View {
          
        ScrollView(showsIndicators: false) {
            
            VStack {

                headerView
                
                itemBarView
                                    
                mainPageView
                
                latestNewsView
            }
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
            .navigationBarHidden(true)
    }
}

extension HomeView {
    
    private var headerView: some View {
        
        HStack {
            
            Text("인사이트")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            AlarmView(imageName: "bell")
                .padding(.trailing)
        }
        .padding()
        .padding(.top,20)
    }
    
    private var itemBarView: some View {
        
        HStack {
            
            ItemBarView(selectedItem: $selected, item: "발매정보", animation: animation)
            
            ItemBarView(selectedItem: $selected, item: "브랜드", animation: animation)
            
            ItemBarView(selectedItem: $selected, item: "전시회", animation: animation)
        }
        .background(Color.black.opacity(0.04), in: RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var mainPageView: some View {

        if !vm.main_news.isEmpty {
            
            let filterNews = vm.main_news.filter{$0.category == selected}
            
            switch selected {

            case "발매정보":
                HomeCarousel(news: filterNews)
            case "브랜드":
                HomeCarousel(news: filterNews)
            default: // "전시회"
                HomeCarousel(news: filterNews)
            }

        } else {

            ProgressView()
        }
    }
    
    @ViewBuilder
    private var latestNewsView: some View {
        
        if !vm.all_news.isEmpty {
            
            let filterNews = vm.all_news.filter{$0.category == selected}
            
            switch selected {

            case "발매정보":
                NewsView(news: filterNews)
            case "브랜드":
                NewsView(news: filterNews)
            default: // "전시회"
                NewsView(news: filterNews)
            }
        }
    }
}
