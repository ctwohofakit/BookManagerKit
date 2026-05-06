//
//  BookDetailCard.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/5/26.
//

import SwiftUI

struct BookDetailCard: View {
    var title: String = ""
    var text: String = ""
    var before: some View = EmptyView()
    var maxHeight: CGFloat = 200
    
    var body: some View {
        VStack{
            Text(title)
                .font(.headline)
                .padding(.bottom)
            before
            Text(text)
        }.frame(maxWidth:320, maxHeight:150)
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(10)
        
        
        
    }
}

#Preview {
    BookDetailCard()
}
