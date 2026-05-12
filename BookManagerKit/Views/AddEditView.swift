//
//  AddEditView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
//

import SwiftUI

struct AddEditView: View {
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
    
    //empty set up
    @State var title:String = ""
    @State var author:String = ""
    @State var summary:String = ""
    @State var selectedCover:String = "lotr_fellowship"
    @State var rating:Int = 0
    @State var review:String = ""
    @State var isFavorite:Bool = false
    @State var genre: Genre = .unknown
    @State var readingStatus: ReadingStatus = .unknown
    
    
    //when using the self is from top down to check
    
    //call for the binding book from outside, using _ to get binding from init
    init(book: Binding<Book>){
        self._book = book
        self._title = .init(initialValue: book.wrappedValue.title)
        self._author = .init(initialValue: book.wrappedValue.author)
        self._summary = .init(initialValue: book.wrappedValue.summary)
        self._selectedCover = .init(initialValue: book.wrappedValue.coverImage)
        self._rating = .init(initialValue: book.wrappedValue.rating)
        self._review = .init(initialValue: book.wrappedValue.review)
        self._isFavorite = .init(initialValue: book.wrappedValue.isFavorite)
        self._genre = . init(initialValue: book.wrappedValue.genre)
        self._readingStatus = .init(initialValue: book.wrappedValue.readingStatus)
    }
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Book Details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height:150)
                    Picker("Genre", selection: $genre){
                        //go to the Genre model
                        ForEach(Genre.allCases, id:\.self){genre in
                            Text(genre.rawValue).tag(genre)
                            
                        }
                    }
                    
                    Picker("Cover", selection: $selectedCover){
                        Text("The Fellowship of the ring").tag("lotr_fellowship")
                        Text("The Return of the king").tag("lotr_king")
                        Text("The Two Tower").tag("lotr_towers")
                    }
                }
                Section(header:Text("My Rating and Review")){
                                        Picker("Rating", selection:$rating){
                                            Text("★").tag(1)
                                            Text("★★").tag(2)
                                            Text("★★★").tag(3)
                                            Text("★★★★").tag(4)
                                            Text("★★★★★").tag(5)
                                        }.pickerStyle(.menu)
//                    HStack{
//                        ForEach(1...5, id:\.self){ index in
//                            Image(systemName: index <= rating ? "star.fill": "star")
//                                .font(.title2)
//                                .foregroundStyle(.yellow)
//                            
//                        }
//                    }
                    
                    Picker("Reading Status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                            
                        }
                    }
                    TextEditor(text: $review)
                        .frame(height:130)
                }
                    
                }.background(.gray.opacity(0.1))
   
            .navigationTitle(book.title.isEmpty ? "Add Book" : "Edit Book")//ternary
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save"){
                            book.title = title
                            book.author = author
                            book.coverImage = selectedCover
                            book.summary = summary
                            book.rating = rating
                            book.review = review
                            book.isFavorite = isFavorite
                            book.genre = genre
                            
                            dismiss()
                        }.disabled(title.isEmpty)
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .primaryAction){
                        FavoriteToggle(isFavorite: $isFavorite, size:.subheadline, useAnimation:false)
                    }
                }
        }
        
        
    }
}


//Parent View
#Preview {
ContentView()
}
