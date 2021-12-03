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
    
    func saveImage(image: UIImage, id: String, path: String) {
        
        createFolderIfNeeded(path: path)
        
        guard
            
            let data = image.pngData(),
            let url = getURLForImage(id: id ,path: path)
                
        else {return}
        
        do {
            try data.write(to: url)
        } catch let error {
            print("error saving image. \(error)")
        }
    }
    
    func getImage(id: String, path: String) -> UIImage? {
        
        guard let url = getURLForImage(id: id, path: path) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(path: String) {
        
        guard let url = getURLFolder(path: path) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("error creating directory. \(error)")
            }
        }
    }
    
    private func getURLFolder(path: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        return url.appendingPathComponent(path)
    }
    
    private func getURLForImage(id: String, path: String) -> URL? {
        
        guard let folderURL = getURLFolder(path: path) else { return nil }
        
        return folderURL.appendingPathComponent(id) // directory/folderURL/id
    }
}
