//
//  BookListView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/7/26.
//
import SwiftData
import SwiftUI

struct BookListView: View {
    @Query var books: [PersistentBook]
    
    @State private var showAddBook:Bool = false
//    @State private var newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"", isFavorite: false, genre: .fantasy)
    
    @AppStorage(SETTINGS_SHOW_RATING) private var showRating: Bool = SETTINGS_SHOW_RATING_VALUE
    
    //use to saving status
    @AppStorage(SETTINGS_SHOW_STATUS) private var showStatus: Bool = SETTINGS_SHOW_STATUS_VALUE
    
    

    
    
    var body: some View {
        NavigationStack{
            
//            Text(newBook.title)
            List(books, id: \.self.id){ book in
                NavigationLink(destination: BookDetailsView(book: book)){
                    BookListItem(book: book, showRating: showRating, showStatus: showStatus)
                }
                
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add"){
                        //toggle change the state to be true
                        showAddBook.toggle()
                
                })
                .sheet(isPresented: $showAddBook){
//                        if (!newBook.title.isEmpty){
//                            books.append(newBook)
//                        }
                    
                    
                    
                    //create new book with the new id
//                        newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"",isFavorite: false)
                    
                    
                    
                        } content:{
                        AddEditView()
                }
        }
        
        
        
        
        
    }
}

//#Preview {
//    BookListView()
//}
