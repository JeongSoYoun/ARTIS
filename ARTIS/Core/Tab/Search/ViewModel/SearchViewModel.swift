//
//  SearchViewModel.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/08.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var filteredMedia: [Media] = []
    @Published var trendNews: [Media] = []
    @Published var textSearch: String = ""
    
    private let DataService: MediaDataService = MediaDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        addSubscriber()
    }
    
    func downloadAllMedia() {
        
        DataService.donwloadAllMedia()
    }
    
    private func addSubscriber() {
        
        $textSearch
            .combineLatest(DataService.$all_media)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterMedia)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedFilteredMedia in
                
                self?.filteredMedia = returnedFilteredMedia
            }
            .store(in: &cancellables)
        
        //dummy data for now.
        DataService.$main_news
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedTrendNews in
                
                self?.trendNews = returnedTrendNews
            }
            .store(in: &cancellables)
    }

    private func filterMedia(text: String, all_media: [Media]) -> [Media] {
        
        guard !text.isEmpty else {
            
            return []
        }
        
        return all_media.filter { (media) -> Bool in
            
            return media.title.contains(text) ||
                   media.category.contains(text) ||
                   media.tag.contains { tag in
                        
                       tag.contains(text)
                   }
        }
    }
}
