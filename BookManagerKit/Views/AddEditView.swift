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
    
    @State var title:String = ""
    @State var author:String = ""
    @State var summary:String = ""
    @State var selectedCover:String = "lotr_fellowship"
    @State var rating:Int = 0
    @State var review:String = ""
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Book Details")){
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.summary)
                        .frame(height:180)
                    Picker("Cover", selection: $book.coverImage){
                        Text("The Fellowship of the ring").tag("lotr_fellowship")
                        Text("The Return of the king").tag("lotr_king")
                        Text("The Two Tower").tag("lotr_towers")
                    }
                    
                }
            }.navigationTitle("Add Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save"){
                            dismiss()
                        }
                    }
                }
        }
        
        
    }
}


//Parent View
#Preview {
    @State var book = Book(title: "", author: "", coverImage: "", summary: "", rating:3, review:"")
    NavigationStack{
        AddEditView(book: $book)
    }
}
