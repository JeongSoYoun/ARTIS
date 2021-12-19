
import SwiftUI
import SwiftUIPullToRefresh

struct HomeView: View {
    
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    @Namespace var animation
    @State private var selected: String = "발매정보"
    
    var body: some View {
        
        RefreshableScrollView(showsIndicators: false) { done in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                LocalFileManager.instance.removeCoverImage()
                vm.fetchData()
                done()
            }
        } content: {
            ScrollView(showsIndicators: false) {
                
                VStack {

                    headerView
                    
                    itemBarView
                                        
                    mainPageView
                    
                    latestNewsView
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
            .preferredColorScheme(.dark)
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
    
    @ViewBuilder
    private var mainPageView: some View {

        if !vm.main_news.isEmpty {
            
            let news = vm.main_news.filter{$0.category == selected}
            
            VStack(alignment: .leading) {
                
                Text("Trending 🔥")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.TextColor)
                    .padding(.horizontal)
                
                switch selected {

                case "발매정보":
                    CustomCarouselSnapView(media: news, spacing: 20, widthOfHiddenCard: 40)
                case "브랜드":
                    CustomCarouselSnapView(media: news, spacing: 20, widthOfHiddenCard: 40)
                default: // "전시회"
                    CustomCarouselSnapView(media: news, spacing: 20, widthOfHiddenCard: 40)
                }
            }
        }
    }
    
    @ViewBuilder
    private var itemBarView: some View {

        if !vm.all_news.isEmpty {

            VStack(alignment: .leading) {

                HStack {

                    ItemBarView(selectedItem: $selected, item: "발매정보", animation: animation)
                    ItemBarView(selectedItem: $selected, item: "브랜드", animation: animation)
                    ItemBarView(selectedItem: $selected, item: "전시회", animation: animation)
                }
                .background(Color.black.opacity(0.04), in: RoundedRectangle(cornerRadius: 10))
                .padding()
            }
        }
    }
    
    @ViewBuilder
    private var latestNewsView: some View {
        
        if !vm.all_news.isEmpty {
            
            let news = vm.all_news.filter{$0.category == selected}
            
            VStack(alignment: .leading) {
                
                Text("새로운 소식 🚀")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.TextColor)
                    .padding(.horizontal)
                
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
