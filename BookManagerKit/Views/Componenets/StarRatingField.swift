//
//  StarRatingField.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/5/26.
//

import SwiftUI


struct StarRatingField: View {
    @Binding var rating: Int
    
//    private func starLevel(index : Int) -> String {
//        return index <= rating ?  "star.fill": "star"
//    }
//    
    
    public var body: some View {
        HStack{
            ForEach(1...5, id:\.self){ index in
                Button(action:{
                    self.rating = index
                }){
                    Image(systemName: index <= rating ? "star.fill": "star")
                        .font(.title2)
                        .foregroundStyle(.yellow)
                    
                }.onTapGesture {
                    rating = index
                }.buttonStyle(.plain)
            }
        }
    }
}

//#Preview {
//    StarRatingField()
//}
