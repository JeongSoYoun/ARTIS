//
//  LocalFileManager.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/04.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveCoverImage(image: UIImage, id: String, cache_dir: String) {
        
        createFolderIfNeeded(id: id)
        
        guard
            
            let data = image.pngData(),
            let url = getURLForCoverImage(id: id, cache_dir: cache_dir)
                
        else {return}
        
        do {
            try data.write(to: url)
            
        } catch let error {
            print("error saving image. \(error)")
        }
    }
    
    func saveContentsImage(image: UIImage, id: String, cache_dir: String, num: Int) {
        
        createFolderIfNeeded(id: id)
        
        guard
            
            let data = image.pngData(),
            let url = getURLForContentsImage(id: id, cache_dir: cache_dir, num: num)
            
        else {return}
        
        do {
            try data.write(to: url)
            
        } catch let error {
            print("error saving image. \(error)")
        }
    }
    
    func getCoverImage(id: String, cache_dir: String) -> UIImage? {
        
        guard let url = getURLForCoverImage(id: id, cache_dir: cache_dir) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    func getContentsImage(id: String, cache_dir: String, num: Int) -> UIImage? {
        
        guard let url = getURLForContentsImage(id: id, cache_dir: cache_dir, num: num) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(id: String) {
        
        guard let url = getURLFolder(id: id) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                
            } catch let error {
                print("error creating directory. \(error)")
            }
        }
    }
    
    private func getURLFolder(id: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        return url.appendingPathComponent(id)
    }
    
    private func getURLForCoverImage(id: String, cache_dir: String) -> URL? {
        
        guard let folderURL = getURLFolder(id: id) else { return nil }
        
        return folderURL.appendingPathComponent(cache_dir) // id/category/cover
    }
    
    private func getURLForContentsImage(id: String, cache_dir: String, num: Int) -> URL? {
        
        guard let folderURL = getURLFolder(id: id) else { return nil }
        
        return folderURL.appendingPathComponent("\(cache_dir)_\(num)") // id/category/contents_num
    }
}
