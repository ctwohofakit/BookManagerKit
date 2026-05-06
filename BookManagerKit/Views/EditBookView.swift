//
//  EditBookView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/1/26.
//

import SwiftUI

struct EditBookView: View {
    @Binding var book: Book
    
    
    @State var title:String = ""
    @State var author:String = ""
    @State var summary:String = ""
    @State var selectedCover:String = "lotr_fellowship"
    @State var rating:Int = 0
    @State var review:String = ""
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header:Text("Book Details")){
                        TextField("\(book.title)", text: $book.title)
                        TextField("\(book.author)", text: $book.author)
                        TextEditor(text: $book.summary)
                            .frame(height:100)
                        Picker("Cover", selection:$book.coverImage){
                            Text("The Fellowship of the ring").tag("lotr_fellowship")
                            Text("The Return of the king").tag("lotr_king")
                            Text("The Two Tower").tag("lotr_towers")
                        }
                    }
                    
                    Section(header:Text("My Rating and Review")){
                        Picker("Rating", selection:$book.rating){
                            Text("★").tag(1)
                            Text("★★").tag(2)
                            Text("★★★").tag(3)
                            Text("★★★★").tag(4)
                            Text("★★★★★").tag(5)
                        }.pickerStyle(.menu)
                            
                        TextEditor(text: $book.review)
                            .frame(height:100)
                    }
                    
                    
                }
            }.background(.gray.opacity(0.1))
            
            .navigationTitle("Edit Book")
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

#Preview {
    @State var book = Book(title: "2 sheep", author: "tim", coverImage: "the", summary: "lorum sadfdasf fer", rating:3, review:"fasdfasdf")
    EditBookView(book: $book)
}
