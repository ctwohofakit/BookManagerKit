//
//  ContentView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//

import SwiftUI
//import SwiftData

struct ContentView: View {
    //mocking data
    var books = [
        Book(title: "Book Title 1", author: "Author 1", coverImage: "lotr_fellowship", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
        
        Book(title: "Book Title 2", author: "Author 2", coverImage: "lotr_king", summary: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. "),
        
        Book(title: "Book Title 3", author: "Author 3", coverImage: "lotr_towers", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
    ]
    
    var body: some View {
        //imperative vs declarative programming
        NavigationStack{
            List(books , id:\.self.title){book in
                NavigationLink(destination: BookDetailView(book: book)){
                    HStack{
                        Image(book.coverImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width:60, height:80)
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }.navigationTitle("Book Manager")
            
        }
        
    }
    
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
