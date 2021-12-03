
import SwiftUI

struct ItemBarView: View {
    
    @Binding var selectedItem: String
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    
    var item: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            
            withAnimation{selectedItem = item}
        }) {
            
            ZStack(alignment: .bottom) {
                
                Text(item)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(selectedItem == item ? Color.theme.accent : Color.theme.SubText)
                    .padding(.bottom,10)
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height:2)
                    
                    if selectedItem == item {
                        
                        Rectangle()
                            .fill(Color.theme.accent)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "ID", in: animation)
                    }

                }
            }
        }
    }
}

//struct ItemBarView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        ItemBarView(selectedItem: .constant("발매 정보"), item: "발매 정보")
//            .previewLayout(.sizeThatFits)
//    }
//}
