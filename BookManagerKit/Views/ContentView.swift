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
    //saves new Books
    @State private var books = getBooks()
    
    //controls the ADDBook
    @State private var showAddBook:Bool = false
    @State private var newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "")
    
    var body: some View {
        //imperative vs declarative programming
        NavigationStack{
            List($books){ book in
                NavigationLink(destination: BookDetailView(book: book)){
                    BookListItem(book: book.wrappedValue)
                }
                
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add View"){
                        //toggle change the state to be true
                        showAddBook.toggle()
                
                })
                .sheet(isPresented: $showAddBook){
                        if (!newBook.title.isEmpty){
                            books.append(newBook)
                        }
                        newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "")
                        } content:{
                        AddEditView(book: $newBook)
                }
        }
        
    }
    
}

#Preview {
    
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
