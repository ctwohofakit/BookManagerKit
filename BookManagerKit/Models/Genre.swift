//
//  Genre.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/9/26.
//

enum Genre:String, CaseIterable, Hashable, Codable{
    case fantasy = "Fantasy"
    case romance = "Romance"
    case horror = "Thriller"
    case mystery = "Mystery"
    case sciFi = "Science Fiction"
    
    case unknown = "Unknown"
}
