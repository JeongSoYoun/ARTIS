//
//  LastPageViewModel.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/06.
//

import Foundation
import Combine

class LastPageViewModel: ObservableObject {
    
    @Published var ex_info: ExhibionInfo? = nil
    
    private let news: News
    private let DataService = NewsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init (news: News) {
        
        self.news = news
        
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        DataService.$exhibionInfo
            .receive(on: DispatchQueue.main)
            .sink { [weak self] info in
                        
                self?.ex_info = info
            }
            .store(in: &cancellables)
    }
    
    func getInfo(collection: String) {
        
        DataService.getInfo(collection: collection, news: news)
    }
}
