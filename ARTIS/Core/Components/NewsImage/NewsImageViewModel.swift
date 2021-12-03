//
//  NewsImageViewModel.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/01.
//

import Foundation
import Firebase
import UIKit
import Combine

class NewsImageViewModel: ObservableObject {

    @Published var coverImage: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let news: News
    private let DataService: NewsImageDataService // communication part
    private var cancellable = Set<AnyCancellable>()
    
    init(news: News) {
        
        self.news = news
        self.DataService = NewsImageDataService(news: news)
        self.isLoading = true
        
        downloadCoverImage()
    }
    
    private func downloadCoverImage() {
        
        DataService.$coverImage
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedCoverImage in
                self?.coverImage = returnedCoverImage
            }
            .store(in: &cancellable)
    }
}
