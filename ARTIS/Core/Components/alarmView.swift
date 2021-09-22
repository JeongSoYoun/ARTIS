
//  alarmView

import SwiftUI

struct alarmView: View {
    
    let imageName: String
    
    var body: some View {
            
            Image(systemName: imageName)
                .font(.headline)
                .frame(width:50, height: 50)
                .background(
                
                    Circle()
                        .foregroundColor(Color.theme.background)
                )
                .shadow(color: Color.theme.mainColor.opacity(0.25),
                        radius: 10, x: 0, y: 0
                )
    }
}

struct alarmView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            alarmView(imageName: "bell")
                .previewLayout(.sizeThatFits)
            
            alarmView(imageName: "bell")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}