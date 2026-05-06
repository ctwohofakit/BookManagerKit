//
//  BookDetailView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//
// Text("edit touch")

import SwiftUI

struct BookDetailView: View {
    @Binding var book:Book
    @State private var showEditBook:Bool = false
    
    
    var body: some View {
//        Text(book.summary)
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Image(book.coverImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height:100)
                    
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
                    
                }.frame(height:150)
               
                //END: Hstack
                VStack{
                    Text("Summary")
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(book.summary)
                    
                    Spacer()
//                    Button("Edit Book"){
//                        book.title = "New Book Here"
//                    }
                
                }.frame(width:320, height:150)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            
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
                    .frame(width:320, height:200)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
            }.padding()
            Spacer()
//        NavigationLink(destination: EditBookView(book: $book)){
//            Button("Edit Book"){}
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Edit"){
                showEditBook.toggle()
            }).sheet(isPresented: $showEditBook){
                
            }content:{
                EditBookView(book: $book)
            }
        }

        
    }



//#Preview {
//    ContentView()
////        .modelContainer(for: Item.self, inMemory: true)
//}
