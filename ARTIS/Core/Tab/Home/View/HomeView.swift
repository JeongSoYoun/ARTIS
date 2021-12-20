
import SwiftUI
import SwiftUIPullToRefresh

struct HomeView: View {
    
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    @Namespace var animation
    @State private var selected: String = "발매정보"
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack {
                
                mainPageView
                
                itemBarView
                
                latestNewsView

            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
    }
}

extension HomeView {
    
    @ViewBuilder
    private var mainPageView: some View {

        if !vm.main_news.isEmpty {
            
            VStack {
                
                ZStack(alignment: .topLeading) {
                
                    CustomCarouselSnapView(media: vm.main_news, spacing: 0, widthOfHiddenCard: 0, leftPadding: 0, showsIndicators: false)
                    
                    HomeHeaderView()
                        .padding(.top,50)
                    
                }
            }
        }
    }
    
    @ViewBuilder
    private var itemBarView: some View {

        if !vm.all_news.isEmpty {

            HStack {

                ItemBarView(selectedItem: $selected, item: "발매정보", animation: animation)
                ItemBarView(selectedItem: $selected, item: "브랜드", animation: animation)
                ItemBarView(selectedItem: $selected, item: "전시회", animation: animation)
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private var latestNewsView: some View {
        
        if !vm.all_news.isEmpty {
            
            let news = vm.all_news.filter{$0.category == selected}
            
            VStack(alignment: .leading) {
                
                switch selected {

                case "발매정보":
                    NewsCollectionRowView(news: news)
                case "브랜드":
                    NewsCollectionRowView(news: news)
                default: // "전시회"
                    NewsCollectionRowView(news: news)
                }
            }
        }
    }
}
