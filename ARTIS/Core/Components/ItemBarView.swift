
import SwiftUI

struct ItemBarView: View {
    
    @Binding var selectedItem: String
    let item: String
//    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {}) {
            
            Text(item)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
            
            ZStack {
                
                Rectangle()
                    .fill(selectedItem == item ? Color.theme.accent : Color.clear)
                    .frame(height:2)
//                    .matchedGeometryEffect(id: "ID", in: animation)
            }
        }
    }
}

struct ItemBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ItemBarView(selectedItem: .constant("발매 정보"), item: "발매 정보")
            .previewLayout(.sizeThatFits)
    }
}
