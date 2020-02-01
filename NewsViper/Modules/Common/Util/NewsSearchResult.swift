//
//  NewsSearchResult.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

struct NewsSearchResult: Codable {
    let status: String
    let totalResults: Int,
    articles: [Article]
}
