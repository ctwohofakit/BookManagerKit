//
//  BookDetailsView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
//

import SwiftUI

struct BookDetailsView: View {
    @Binding var book: Book
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(book.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height:150)
                
                
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
            VStack{
                Text("Summary")
                    .font(.headline)
                    .padding(.bottom)
                
                Text(book.summary)
                Button("Edit Book"){
                    book.title = "New Book Here"
                }
            }
            .padding()
            .background(.gray.opacity(0.3))
            .cornerRadius(10)
            Spacer()
            
        }.padding()
    }
    
}

//#Preview {
//    BookDetailsView(book: Book(title: "Book Title 1", author: "Author 1", coverImage: "lotr_fellowship", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "))
//}
