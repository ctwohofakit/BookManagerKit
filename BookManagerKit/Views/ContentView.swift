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
    //@State private var books = getBooks()
    
    
    
    
    //the name hsa to be the same, and default setting should be the same too
    @AppStorage(SETTINGS_THEME) private var theme: Theme = .system

    @AppStorage(SETTINGS_TINT_COLOR) private var tintColor: Color = SETTINGS_TINT_COLOR_VALUE
    
    
    //can be nil
    //case theme.light: return ColorScheme.dark
    //        input: output
    var colorScheme: ColorScheme? {
        switch(theme){
            case .light: return .light
            case .dark: return .dark
            case .system: return nil
            
        }
    }

 
    
    
    /*
     var colorBackground: Color? {
     swith(readingStatus){
        case .planToRead = .yellow
         case .reading = .brown
         case .finsihed = .green
         case .dropped = .red
         case .unknown = .primary
     
     }
     }
     
     
     
     
     
     */
    
    
    
    //controls the ADDBook
    //State varible, if state update, it will re-render
/*
    @State private var showAddBook:Bool = false
    @State private var newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"", isFavorite: false)*/
    
    var body: some View {
//        TabView{
            //example
//            Tab{}
            /*.tabItem{
             
            Label{"Books", systemImage:""}
             */
            
            TabView{
                BookListView()
                    .tabItem{
                        Label("Books", systemImage: "books.vertical.fill")
                    }
                FavoritesView()
                    .tabItem{
                        Label("Favorites", systemImage: "heart.fill")
                    }
                
                //setting view
                SettingsView()
                    .tabItem{
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                
                
                
            }
            .preferredColorScheme(colorScheme)
            .tint(tintColor)
       
            
        
//        }
        
        //imperative vs declarative programming
//        NavigationStack{
//            
//            Text(newBook.title)
//            List($books){ book in
//                NavigationLink(destination: BookDetailsView(book: book)){
//                    BookListItem(book: book.wrappedValue)
//                }
//                
//            }
//            .navigationTitle("Book Manager")
//            .navigationBarItems(trailing: Button("Add"){
//                        //toggle change the state to be true
//                        showAddBook.toggle()
//                
//                })
//                .sheet(isPresented: $showAddBook){
//                        if (!newBook.title.isEmpty){
//                            books.append(newBook)
//                        }
//                    //create new book with the new id
//                        newBook = Book(title: "", author: "", coverImage: "lotr_fellowship", summary: "", rating: 1, review:"",isFavorite: false)
//                        } content:{
//                        AddEditView(book: $newBook)
//                }
//        }
        
    }
    
}

#Preview {
    
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
