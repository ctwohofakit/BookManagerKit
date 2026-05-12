//
//  GridItem.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/7/26.
//

import SwiftUI

struct GridCard: View {
    var book: Book
    
     var body: some View {
         VStack{
             Text(book.title)
                 .frame(maxWidth: .infinity)
                 .font(.headline)
                 .foregroundStyle(.white)
                 .lineLimit(2) //line limit allow the text cut out
                 .multilineTextAlignment(.center)
             
                 .padding()
                 .background(
                    //color, begining, end
                    LinearGradient(
                        colors:[.clear, .black.opacity(0.8)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                 )
             Spacer()
             Text(book.author)
                 .frame(maxWidth: .infinity)
                 .font(.headline)
                 .foregroundStyle(.white)
                 .lineLimit(2) //line limit allow the text cut out
                 .multilineTextAlignment(.center)
             
                 .padding()
                 .background(
                    //color, begining, end
                    LinearGradient(
                        colors:[.clear, .black.opacity(0.8)],
                        startPoint: .bottom,
                        endPoint: .top
                        )
                    )
             
         }
         .frame(width: .infinity, height: .infinity)
         .background(
            Image(book.coverImage)
                .resizable()
                .scaledToFill()
         )
         .aspectRatio(1, contentMode:.fit)
         .cornerRadius(12)
        
    }
}

#Preview {
ContentView()
}
