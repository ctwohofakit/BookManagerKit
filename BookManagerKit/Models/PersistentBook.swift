//
//  PersistentBook.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/12/26.
//

import UIKit
import SwiftData
import Foundation
 //this will add the id, so no need to inclue the UUID
@Model

class PersistentBook {
    var title: String
    var author: String
    //Image
    
    var summary: String
    var rating: Int
    var review: String
    var isFavorite: Bool
    var genre: Genre
    var readingStatus: ReadingStatus
    var coverData: Data?
    
    init(
        title: String = "",
        author: String = "",
        
        summary: String = "",
        rating: Int = 0,
        review: String = "",
        isFavorite: Bool = false,
        genre: Genre = .unknown,
        readingStatus: ReadingStatus = .unknown
        
        
    ){
        self.title = title
        self.author = author
        self.summary = summary
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.genre = genre
        self.readingStatus = readingStatus
    }
    
    
    var cover: UIImage {
        if self.coverData != nil {
            return UIImage(data: self.coverData!)!
        } else {
            return UIImage(resource: .defaultBook)
        }
    }
    
}

