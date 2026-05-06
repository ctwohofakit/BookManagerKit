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
    //State varible, if state update, it will re-render
    @State private var showAddBook:Bool = false
    @State private var newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"")
    
    var body: some View {
        //imperative vs declarative programming
        NavigationStack{
            
            Text(newBook.title)
            List($books){ book in
                NavigationLink(destination: BookDetailsView(book: book)){
                    BookListItem(book: book.wrappedValue)
                }
                
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add"){
                        //toggle change the state to be true
                        showAddBook.toggle()
                
                })
                .sheet(isPresented: $showAddBook){
                        if (!newBook.title.isEmpty){
                            books.append(newBook)
                        }
                    //create new book with the new id
                        newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"")
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
