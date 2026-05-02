//
//  BookDetailView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book:Book
    
    
    
    var body: some View {
//        Text(book.summary)
        NavigationStack{
            VStack{
                HStack{
                    Image(book.coverImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height:140)
                    
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
                    
                }.frame(width:320, height:150)
                .padding()
                //END: Hstack
                VStack{
                    Text("Summary")
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(book.summary)
                    
                    Spacer()
                    Button("Edit Book"){
                        book.title = "New Book Here"
                    }
                }.frame(width:320, height:420)                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                Spacer()
                
            }.padding()
        }.navigationTitle("Book Details")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}


#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
