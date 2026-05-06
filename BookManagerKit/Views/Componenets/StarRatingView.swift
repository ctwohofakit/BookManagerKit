//
//  StarRatingView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/5/26.
//

import SwiftUI

struct StarRatingView: View {
    
    var rating: Int
    public var body: some View {
        HStack{
            ForEach(1...5, id:\.self){ index in
                Image(systemName: index <= rating ? "star.fill": "star")
                    .font(.title2)
                    .foregroundStyle(.yellow)
            }
        }
    
    }
}

//#Preview {
//    StarRatingView()
//}
