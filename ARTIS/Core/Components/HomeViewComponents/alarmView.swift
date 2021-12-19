
//  alarmView

import SwiftUI

struct AlarmView: View {
    
    let imageName: String
    
    var body: some View {
            
            Image(systemName: imageName)
                .font(.headline)
                .frame(width:30, height: 30)
                .foregroundColor(Color.theme.background)
                .background(
                
                    Circle()
                        .foregroundColor(Color.theme.MainColor)
                )
                .shadow(color: Color.theme.MainColor.opacity(0.25),
                        radius: 10, x: 0, y: 0
                )
    }
}

struct alarmView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            AlarmView(imageName: "bell")
                .previewLayout(.sizeThatFits)
            
            AlarmView(imageName: "bell")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
