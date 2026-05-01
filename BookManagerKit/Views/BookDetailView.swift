//
//  BookDetailView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//

import SwiftUI

struct BookDetailView: View {
    var book:Book
    
    
    
    var body: some View {
//        Text(book.summary)
        NavigationStack{
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
                }
                .padding()
                .background(.gray.opacity(0.3))
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
