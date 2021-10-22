
import Foundation
import Firebase
import FirebaseFirestoreSwift

struct News: Identifiable, Codable {
    
    @DocumentID var id: String?
    let image_name: String
    let title: String
    let subject: String
}


