//
//  utils.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/9/26.
//

/*
 build an array
 pass book and genere to check,
 if is favorite, then check if the genre is nil or book.genre is equal to the genre
 
 return result only is not
 
 */
func filterFavoriteBook(book:[PersistentBook], genre:Genre?, readingStatus:ReadingStatus?)->[PersistentBook]{
    
        book.filter {book in
            book.isFavorite && (
                genre == nil
                || book.genre == genre
                
            ) && (
                readingStatus == nil
                || book.readingStatus == readingStatus
            )
        }
    
    
}


