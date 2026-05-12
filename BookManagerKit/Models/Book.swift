//
//  Book.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//
import Foundation

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var coverImage: String
    var summary: String
    
    //These are for assignment 2
    var rating: Int
    var review: String
    
    //106-1
    var isFavorite: Bool
    
    //106-2
    //genre
    //readingStatus
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
    
    
    
    
    
}

//106-1

