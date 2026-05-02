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
    
}

