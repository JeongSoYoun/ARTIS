
import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var megazine_dev: DeveloperPreview_Megazine {
        
        return DeveloperPreview_Megazine.instance
    }
}

class DeveloperPreview_Megazine {
    
    static let instance = DeveloperPreview_Megazine()
    
    private init() {}
    
    var megazines: [megazineModel] = [
        
        megazineModel(id: 0, offset: 0, image: "carti", title: "카니예 웨스트, 뎀나, 그리고 마르지엘라와 돈다."),
        megazineModel(id: 1, offset: 0, image: "supreme", title: "카니예 웨스트"),
        megazineModel(id: 2, offset: 0, image: "sun", title: "카니예 웨스트"),
        megazineModel(id: 3, offset: 0, image: "kanye", title: "카니예 웨스트")
    ]
    
    @State var scrolled: Int = 0
}
