//
//  NewsCell.swift
//  NewsApp
//
//  Created by Нургазы on 22/2/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    var downloadTask: URLSessionDownloadTask?

    override func awakeFromNib() {
        super.awakeFromNib()

        newsImage.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    func configureCell(for article: Article) {
        
        titleLabel.text = article.title
        dateLabel.text = article.publishedAt
        
        newsImage.image = UIImage(systemName: "newspaper")
        
        if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
            downloadTask = newsImage.loadImage(url: url)
            
        }
        
    }
    
}
