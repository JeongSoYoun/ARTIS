
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

                latestNewsView
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("")
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
            .preferredColorScheme(.light)
    }
}

extension HomeView {
    
    @ViewBuilder
    private var mainPageView: some View {

        if !vm.main_news.isEmpty {
            
            CustomCarouselSnapView(media: vm.main_news, spacing: 0, widthOfHiddenCard: 0, leftPadding: 0, showsIndicators: false, isAnimation: false, isCustomImage: true)
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
            
            VStack(alignment: .trailing) {
                
                HStack {
                    
                    Text("뉴스")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.TextColor)
                    
                    Spacer()
                    
                    Text("더 보기")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.TextColor)
                    
                    Image(systemName: "chevron.right")
                }
                .padding()
                .padding(.top)
                          
                ForEach(0 ..< 4, id: \.self) { index in
                    
                    NewsRowView(news: vm.all_news[index])
                }
            }
        }
    }
}
