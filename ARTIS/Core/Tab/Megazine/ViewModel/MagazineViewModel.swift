
import Foundation
import SwiftUI
import Combine

class MagazineViewModel: ObservableObject {
    
    @Published var magazines: [Media] = []
    
    private let DataService: MediaDataService = MediaDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        addSubscriber()
        DataService.downloadMagazines()
    }
    
    private func addSubscriber() {
        
        DataService.$magazines
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedMagazines in
                self?.magazines = returnedMagazines
            }
            .store(in: &cancellables)
    }
}
