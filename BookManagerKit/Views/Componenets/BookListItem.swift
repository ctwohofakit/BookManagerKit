//
//  BookListItem.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
//

import SwiftUI

struct BookListItem: View {
    
    
    var book: Book
    
    var body: some View {
        HStack{
            Image(book.coverImage)
                .resizable()
                .scaledToFit()
                .frame(width:60, height:80)
            VStack(alignment: .leading){
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                HStack{
                    Text("\(book.rating)")
                        .font(.subheadline)
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width:10, height:10)
                }
            }
        }
    }
}


//tool that acts like a parent view
#Preview {
    BookListItem(book: Book(title: "title", author: "author", coverImage: "lotr_fellowship", summary: "summary", rating: 3, review:"", isFavorite:true, genre: .fantasy))
}
