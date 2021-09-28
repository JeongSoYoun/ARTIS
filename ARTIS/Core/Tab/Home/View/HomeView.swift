
// Home View

import SwiftUI

struct HomeView: View {
    
    @State var selectedItem: String = "발매 정보"
    @ObservedObject var carouselVM: CarouselViewModel
    @Namespace var animation
    
    var body: some View {
          
        NavigationView {
            
            ScrollView {
                
                VStack {
    
                    headerView
                    
                    itemBarView
                    
                    CarouselView(itemHeight: 200, views: carouselVM.viewList(menu: "sneakers").0, title: carouselVM.viewList(menu: "sneakers").1)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            
            HomeView(carouselVM: CarouselViewModel())
                .navigationBarHidden(true)
        }
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
}
