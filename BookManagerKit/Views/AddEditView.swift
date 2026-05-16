//
//  AddEditView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    var book: PersistentBook?
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    //empty set up
    @State var title:String//= ""
    @State var author:String// = ""
    @State var summary:String// = ""
//    @State var selectedCover:String// = "lotr_fellowship"
    @State var rating:Int// = 0
    @State var review:String //= ""
    @State var isFavorite:Bool// = false
    @State var genre: Genre //=.unknown
    @State var readingStatus: ReadingStatus// = .unknown
    
    @State var coverData: Data?
    
    //when using the self is from top down to check
    
    //call for the binding book from outside, using _ to get binding from init
    init(book: PersistentBook? = nil){
        //did I recieve a book to edit
        if let book {
            self.book = book
            title = book.title
            author = book.author
            summary = book.summary
            //            selectedCover:String = "lotr_fellowship"
            rating = book.rating
            review = book.review
            isFavorite = book.isFavorite
            genre = book.genre
            readingStatus = book.readingStatus
            if let data = book.coverData{
                self.coverData = data
            }
        }
        // I didn't recieve a book to edit
        else {
            title = ""
            author = ""
            summary = ""
            //            selectedCover:String = "lotr_fellowship"
            rating = 0
            review = ""
            isFavorite = false
            genre = .unknown
            readingStatus = .unknown
            
            
            
        }
        
        
        
        /*
         
         self._book = book
         self._title = .init(initialValue: book.wrappedValue.title)
         self._author = .init(initialValue: book.wrappedValue.author)
         self._summary = .init(initialValue: book.wrappedValue.summary)
         self._selectedCover = .init(initialValue: book.wrappedValue.coverImage)
         self._rating = .init(initialValue: book.wrappedValue.rating)
         self._review = .init(initialValue: book.wrappedValue.review)
         self._isFavorite = .init(initialValue: book.wrappedValue.isFavorite)
         self._genre = . init(initialValue: book.wrappedValue.genre)
         self._readingStatus = .init(initialValue: book.wrappedValue.readingStatus)*/
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
                    
                }
                Section(header:Text("Book Cover")){
                    ImageField(imageData: $coverData)
                }
                
                Section(header:Text("My Rating and Review")){
                    StarRatingField(rating: $rating)
                
//                        Picker("Rating", selection:$rating){
//                            Text("★").tag(1)
//                            Text("★★").tag(2)
//                            Text("★★★").tag(3)
//                            Text("★★★★").tag(4)
//                            Text("★★★★★").tag(5)
//                        }.pickerStyle(.menu)
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
            
                    .navigationTitle(book == nil ? "Add Book" : "Edit Book")//ternary
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .confirmationAction){
                            Button("Save"){
                                let isNewBook = book == nil
                                let bookToSave = book ?? PersistentBook(title: "")
                                
                                bookToSave.title = title
                                bookToSave.author = author
                                //                          bookToSave.coverImage = selectedCover
                                bookToSave.summary = summary
                                bookToSave.rating = rating
                                bookToSave.review = review
                                bookToSave.isFavorite = isFavorite
                                bookToSave.genre = genre
                                bookToSave.readingStatus = readingStatus
                                if isNewBook {
                                    modelContext.insert(bookToSave)
                                }
                                if let coverData {
                                    bookToSave.coverData = coverData
                                }
                                do {
                                    try modelContext.save()
                                } catch {
                                    print ("fail to save book:\(error)")
                                }
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
//        .modelContainer(for: PersistentBook.self, inMemory: true)
}
