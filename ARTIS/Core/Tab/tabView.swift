
import SwiftUI

struct tabView: View {
    
    @State var selectedTab: Int = 0
    
    private var tabItem: [String] = [
        
        "flame",
        "rectangle.portrait.on.rectangle.portrait",
        "magnifyingglass",
        "person"
    ]
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                switch selectedTab {
                    
                case 0:
                    NavigationView {
                        
                        HomeView()
                    }
                    
                default:
                    
                    MegazineView()
                }
            }
            
            Divider()
            
            HStack(spacing:20) {
                
                ForEach(0 ..< 4 , id: \.self) { index in
                    
                    Spacer()
                    Button(action: {
                        
                        self.selectedTab = index
                    }) {
                        
                        Image(systemName: tabItem[index])
                            .font(.system(size: 25,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(selectedTab == index ? Color.theme.accent : Color.theme.SubText)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct tabView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        tabView()
    }
}
