//
//  api.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
//api is the bridge of 2 things

func getBooks()-> [Book] {
    return [
        Book(title: "Book Title 1", author: "Author 1", coverImage: "lotr_fellowship", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing fghjkgh elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", rating: 3, review: "amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true, genre: .fantasy, readingStatus: .reading),
        
        Book(title: "Book Title 2", author: "Author 2", coverImage: "lotr_king", summary: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used inm,mn,m, laying out print, graphic or web designs. ", rating: 4, review: "amet, consectetur adiphjlkliscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: false, genre: .horror, readingStatus: .planToRead),
        
        Book(title: "Book Title 3", author: "Author 3", coverImage: "lotr_towers", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",  rating: 5, review: "klbbvvamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true, genre: .mystery, readingStatus: .dropped),
        
        Book(title: "Book Title 4", author: "Author d", coverImage: "lotr_king", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",  rating: 5, review: "klbbvvamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true, genre: .mystery, readingStatus: .finsihed),
        
        Book(title: "Book Title 5", author: "Author c", coverImage: "lotr_towers", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",  rating: 5, review: "klbbvvamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true, genre: .mystery, readingStatus: .dropped),
        
        Book(title: "Book Title 6", author: "Author b", coverImage: "lotr_king", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",  rating: 5, review: "klbbvvamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true, genre: .mystery, readingStatus: .planToRead),
        
        Book(title: "Book Title 7", author: "Author A", coverImage: "lotr_towers", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",  rating: 5, review: "klbbvvamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isFavorite: true, genre: .mystery, readingStatus: .reading)
        
        
    ]
    
    
}
