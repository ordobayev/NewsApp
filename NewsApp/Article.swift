//
//  Article.swift
//  NewsApp
//
//  Created by Нургазы on 22/2/21.
//

import Foundation

struct Article: Codable {
    var title: String
    var url: String
    var urlToImage: String?
    var publishedAt: String
}
