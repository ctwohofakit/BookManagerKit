//
//  BookDetailsView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
// edit touch

import SwiftUI

struct BookDetailsView: View {
    @Binding var book: Book
    
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(book.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:100, maxHeight:150)
                
                
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "book.pages.fill")
                        Text(book.title)
                            .font(.title2)
                            .bold()
                    }.foregroundStyle(.brown)
                    HStack{
                        Image(systemName: "pencil.and.outline")
                        Text("by \(book.author)")
                            .font(.subheadline)
                            .bold()
                    }.foregroundStyle(.secondary)
                }
                
            }//END: Hstack
            VStack(alignment: .center){
             
            BookDetailCard(title: "Summary", text: book.summary)
//            BookDetailCard(tile:"Review",text: book.review,){}
            }
            
            VStack(alignment: .center){
                Text("My Review")
                    .font(.headline)
                HStack{
//                        Text("\(book.rating)")
//                            .bold()
//                            .font(.subheadline)
                    ForEach(0..<book.rating, id: \.self){_ in
                        Text("★")
                    }
                }.foregroundStyle(.blue)
                Text("\(book.review)")
                Spacer()
                
                }
                .frame(maxWidth:320, maxHeight:210)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            }.padding()
            Spacer()
            
           .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Edit"){
                    showEditSheet.toggle()
                }).sheet(isPresented: $showEditSheet){
                    
                }content:{
//                    EditBookView(book: $book)
                    AddEditView(book: $book)
                }
            }

    }
    


#Preview {
    
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}

