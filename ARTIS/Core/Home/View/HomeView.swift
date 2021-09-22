
// Home View

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        ScrollView {
            
            headerView
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    private var headerView: some View {
        
        HStack {
            
            Text("인사이트")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            alarmView(imageName: "bell")
        }
        .padding()
    }
}
