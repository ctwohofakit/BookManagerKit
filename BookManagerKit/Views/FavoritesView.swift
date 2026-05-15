//
//  FavoriteBooksView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/7/26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Query var books: [PersistentBook]
    @State private var showFilter:Bool = false
    @State var selectedGenre: Genre?
    @State var selectedStatus: ReadingStatus?
    
   
    
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns:Int = 2
    
    //change to ocmputed varible {} a fucntion to return an array
    var gridLayout:[GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridColumns)
    }
    
    //[GridItem(.flexible()), GridItem(.flexible())]
    
    //computed property: it is var that based on other value
    private var favoriteBooks: [PersistentBook]{
        filterFavoriteBook(book: books, genre: selectedGenre, readingStatus: selectedStatus)
//        books.filter{
//            //$0 is the first item
//            $0.isFavorite
        
//        }
    }
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                //grid can be the same width _, _,_ in next row
                LazyVGrid(columns: gridLayout){
                    ForEach(favoriteBooks) { book in
                        
                        GridCard(book: book)
                    
                    }
                }
                //CG float is type of the varible for the graphic property to render there
                .padding(.all, CGFloat(8/2))
                //compiler on formula will be the same as the final result excution time
                
            }//end:scroll
            .navigationTitle("Favorite")
            .navigationBarItems(
                trailing:
                Button("Filter"){
                        self.showFilter.toggle()
                    }
                    .sheet(isPresented: $showFilter){
                        // sheet slide up view
                        FilterBooksView(selectedGenre: $selectedGenre, selectedStatus:  $selectedStatus)
                        
                        
                        
                        
                        
                        
                        
                    }
            
                )//nav button
            
            
        }//end of nav stack
        
        
        
    }//End: body
}

#Preview {
    ContentView()
}
