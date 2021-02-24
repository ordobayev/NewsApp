//
//  UIImageView+LoadImage.swift
//  NewsApp
//
//  Created by Нургазы on 23/2/21.
//

import UIKit

extension UIImageView {
    
    func loadImage(url: URL) -> URLSessionDownloadTask {
        
        let session = URLSession.shared
        
        let downloadTask = session.downloadTask(with: url) { (url, response, error) in
            
            if let error = error {
                print("ERROR Loading image: \(error.localizedDescription)")
                return
            }
            
            if let url = url, let data = try? Data(contentsOf: url), let imageDownloaded = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    self.image = imageDownloaded
                }
            
            }
            
        }
        
        downloadTask.resume()
        return downloadTask
    }
}
