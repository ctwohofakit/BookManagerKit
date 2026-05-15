//
//  BookDetailsView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
// edit touch

import SwiftUI
import SwiftData

struct BookDetailsView: View {
    var book: PersistentBook
    
    @State private var isFavorite: Bool
    @State private var showEditSheet: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    init(book:PersistentBook){
        self.book = book
        self.isFavorite = book.isFavorite
    }
    
    
    
    var statusBackground: Color{
        
        switch(book.readingStatus.rawValue){
        case "Plan to read" : return .yellow
        case "Reading" : return .purple
        case "Finished" : return .green
        case "Dropped" : return .red
        case "Unknown" : return .primary
        default : return .primary
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(uiImage: book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:100, maxHeight:150)
                
                
                VStack(alignment: .leading){
                    Spacer()
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
                    HStack{
                        ColoredCapsule(text: book.genre.rawValue)
                        ColoredCapsule(text: book.readingStatus.rawValue, color: statusBackground)
                    }
                    
                    Spacer()
                    
                    
                    
                    
                    //MARK: ---favorite toggle---
                    HStack{
                        Spacer()
                        FavoriteToggle(isFavorite: $isFavorite)
                            .onChange(of: isFavorite){ _, value in
                                book.isFavorite = value
                                try? modelContext.save()
                            }
                            .padding()
               
                        
                    }
                    .frame(maxWidth: .infinity , maxHeight:150)
                }
                }//END: Vstack
                VStack(alignment: .center){
                    BookDetailCard(title: "Summary", text: book.summary)
                  
                    //            BookDetailCard(tile:"Review",text: book.review,){}
                }
                
//                .frame(maxWidth:400, maxHeight:210)
                
                VStack(alignment: .center){
                    Text("My Review")
                        .font(.headline)
                        .padding()
                    HStack{
                        //                        Text("\(book.rating)")
                        //                            .bold()
                        //                            .font(.subheadline)
                        ForEach(0..<book.rating, id: \.self){_ in
                            Text("★")
                        }
                    
                       
          
                    }.foregroundStyle(.blue)
//                    Text("\(book.review)")
    
                    
                    Text(book.review)
                    Spacer()
                    
                }
                .frame(maxWidth:400, maxHeight:210)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            }
            
            .padding()
            Spacer()
                .navigationTitle("Book Details")
                .navigationTitle("Book Details")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Edit"){
                    showEditSheet.toggle()
                }).sheet(isPresented: $showEditSheet){
                    
                }content:{
                    //                    EditBookView(book: $book)
                    AddEditView(book: book)
                }
        }
        
    
}


#Preview {
    
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}

