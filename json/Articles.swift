//
//  Articles.swift
//  json
//
//  Created by Esha Gundeti on 22/09/19.
//  Copyright © 2019 Felix Felicis. All rights reserved.
//

import Foundation

class Articles : Codable {
    
    let status : String
    let totalResults : Int
    let articles : [SingleReport]
    
    init(status: String, totalResults: Int, articles: [SingleReport]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

class SingleReport : Codable {
    
    let source :SourceDetails
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
    
    init(source: SourceDetails, author: String?, title: String?, description: String?, url: String?, urlToImage:String?, publishedAt: String?, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}

class SourceDetails : Codable {
    let id : String?
    let name : String?
    
    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
}

