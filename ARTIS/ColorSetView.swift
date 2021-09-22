
import SwiftUI

struct ColorSetView: View {
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            VStack {
                
                Text("< Color Set 🎨 >")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.bold)
                    .padding()

                Text("Backkground Color")
                    .foregroundColor(Color.theme.background)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Sub Text")
                    .foregroundColor(Color.theme.subText)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Main Color")
                    .foregroundColor(Color.theme.mainColor)
                    .fontWeight(.bold)
                    .padding()
            }
            .font(.headline)
            .padding()
        }
    }
}

struct ColorSetView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            ColorSetView()
                .previewLayout(.sizeThatFits)
            
            ColorSetView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }

    }
}
