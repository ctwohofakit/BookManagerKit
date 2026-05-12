//
//  BookListView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/7/26.
//

import SwiftUI

struct BookListView: View {
    @Binding var books: [Book]
    
    @State private var showAddBook:Bool = false
    @State private var newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"", isFavorite: false, genre: .fantasy)
    
    
    
    var body: some View {
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
                        newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"",isFavorite: false)
                        } content:{
                        AddEditView(book: $newBook)
                }
        }
        
        
        
        
        
    }
}

//#Preview {
//    BookListView()
//}
