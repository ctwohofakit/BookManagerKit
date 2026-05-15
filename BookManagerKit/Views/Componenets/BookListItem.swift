//
//  BookListItem.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/30/26.
//

import SwiftUI

struct BookListItem: View {
    
    
    var book: PersistentBook
    var showRating: Bool
    var showStatus: Bool


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
  
    @AppStorage(SETTINGS_TITLE_SIZE) private var titleSize: TitleSize = SETTINGS_TITLE_SIZE_VALUE

    var fontHead: Font{
        switch(titleSize){
        case .small : return .headline
        case .medium : return .title2
        case .big : return .title
 
        }
    }


    
    var body: some View {
        HStack{
            Image(uiImage: book.cover)
                .resizable()
                .scaledToFit()
                .frame(width:60, height:80)
            VStack(alignment: .leading){
                HStack{
                    Text(book.title)
                        .font(fontHead)
                    if showStatus{
                        ColoredCapsule(text: book.readingStatus.rawValue, color: statusBackground)
                    }
                }
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                if showRating{
                    HStack{
                        Text("\(book.rating)")
                            .font(.subheadline)
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width:10, height:10)
                    }
                }
            }
        }
    }
}


//tool that acts like a parent view
#Preview {
    ContentView()
}
