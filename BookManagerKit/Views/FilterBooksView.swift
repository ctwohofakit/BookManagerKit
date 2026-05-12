//
//  Untitled.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/9/26.
//

import SwiftUI

struct FilterBooksView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    //maybe, Genre or maybe nil
    //no filter selcted = nil
    @Binding var selectedGenre: Genre?
    @Binding var selectedStatus: ReadingStatus?
    
    //temp storage
    @State var tempGenre: Genre?
    @State var tempStatus: ReadingStatus?
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Select a genre"){
                    //empty var to store the genre
                Picker("Genre", selection: $tempGenre){
                    
                    //this is nil, but the nil belond to genre nil as Genre?
                    Text("No genre selected").tag(nil as Genre?)
                    ForEach(Genre.allCases, id:\.self){ genre in
                        Text(genre.rawValue).tag(genre)
                    }
                    }
                }
                Section("Select a status"){
                    Picker("Status", selection: $tempStatus){
                        Text("No status selected").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                        }
                    }
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                        Button("Apply"){
                            selectedGenre = tempGenre
                            selectedStatus = tempStatus
                            dismiss()
                        }
                    }
//                ToolbarItem(placement: cancellationAction){
//                    Button("Clear"){
//                        
//                    }
//                }
                
                
                }//end tool bar
        }
        
    }
}
