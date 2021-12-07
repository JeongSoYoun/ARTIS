
import SwiftUI

struct tabView: View {
    
    @State var selectedTab: Int = 0
    @State var isTabShow: Bool = true
    @ObservedObject var homeVM: HomeViewModel = HomeViewModel()
    
    private let tabVM = tabViewModel()

    var body: some View {
        
        VStack(spacing:0) {
            
            tabSwitchView
            
            Divider()
            
            tabBarView
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct tabView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        tabView()
    }
}

extension tabView {
    
    private var tabSwitchView: some View {
        
        ZStack {
            
            switch selectedTab {
                
            case 0:
                
                HomeView(vm: homeVM)
                
            case 1:
                
                MegazineView(megazineVM: MegazineViewModel())
                    .navigationTitle("카드 메거진 🎃")
            
            case 2:
        
                SearchView(searchText: $homeVM.searchText)
                    .navigationTitle("검색하기")

            default:
                
                ProfileView()
            }
        }
    }
    
    private var tabBarView: some View {
        
        HStack(spacing: 20) {
            
            ForEach(0 ..< 4 , id: \.self) { index in
                
                Spacer()
                
                VStack(spacing: 5) {
                    
                    Image(systemName: tabVM.tabItemList[index].tabItemImage)
                        .font(.system(size: 15,
                                      weight: .regular,
                                      design: .default))
                        .foregroundColor(selectedTab == index ? Color("myColor") : Color.theme.SubText)
                    
                    Text(tabVM.tabItemList[index].tabItemText)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(selectedTab == index ? Color("myColor") : Color.theme.SubText)
                }
                .onTapGesture {
                    
                    self.selectedTab = index
                }
            }
            
            Spacer()
        }
        .padding(.top,10)
    }
}
