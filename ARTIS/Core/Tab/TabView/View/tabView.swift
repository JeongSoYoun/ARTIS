
import SwiftUI

struct tabView: View {
    
    @State var selectedTab: Int = 0
    
    private let tabVM = tabViewModel()

    var body: some View {
        
        VStack {
            
            tabSwitchView
            
            Divider()
            
            tabButtonView
        }
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
                
                HomeView()
                
            case 1:
                
                MegazineView()
            
            case 2:
                
                SearchView()
        
            default:
                
                ProfileView()
            }
        }
    }
    
    private var tabButtonView: some View {
        
        HStack(spacing:20) {
            
            ForEach(0 ..< 4 , id: \.self) { index in
                
                Spacer()
                
                Button(action: {
                    
                    self.selectedTab = index
                }) {
                    
                    Image(systemName: tabVM.tabItemList[index].tabItemImage)
                        .font(.system(size: 20,
                                      weight: .regular,
                                      design: .default))
                        .foregroundColor(selectedTab == index ? Color("myColor") : Color.theme.SubText)
                }
            }
            
            Spacer()
        }
    }
}