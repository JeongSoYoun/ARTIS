
import SwiftUI

struct MegazineView: View {
    
    @StateObject var megazineVM: MegazineViewModel
    
    var body: some View {
        
        cardMegazine
    }
}

struct MegazineView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MegazineView(megazineVM: MegazineViewModel())
            .navigationTitle("카드 메거진")
    }
}

extension MegazineView {
    
    private var cardMegazine: some View {
        
        VStack {
            
            Spacer()
            
            ZStack {
                
                CardMegazineView(megazines: megazineVM.all_meagazines)
            }
            .frame(maxHeight: (UIScreen.main.bounds.height)/2)
            
            Spacer()
        }
    }
}
