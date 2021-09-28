
import Foundation

struct NewsModel: Identifiable {
    
    let id: String = UUID().uuidString
    let image_name: String
    let title: String
    let subject: String
}
