
import Foundation

struct News: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    let image_name: String
    let title: String
    let subject: String
}


