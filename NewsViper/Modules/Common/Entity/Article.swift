//
//  Article.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

public struct ArticleSource: Codable {
    let id: String?
    let name: String?
}

public struct Article: Codable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
