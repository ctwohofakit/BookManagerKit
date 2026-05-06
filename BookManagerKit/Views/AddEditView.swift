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
    }
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Book Details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height:150)
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
                            
                            
                            dismiss()
                        }.disabled(title.isEmpty)
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                }
        }
        
        
    }
}


//Parent View
#Preview {
    @State var book4 = Book(title: "", author: "", coverImage: "", summary: "", rating:3, review:"")
    NavigationStack{
        AddEditView(book: $book4)
    }
}
