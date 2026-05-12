//
//  favoritToggle.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/7/26.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite:Bool
    var size: Font = .title2
    var useAnimation: Bool = true
    
    @State private var opacity: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        ZStack{
            //first at the bottom
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
                .font(size)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y:offsetY)
            
            
            Toggle(isOn: $isFavorite){
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? .red : .gray)
                    .font(size)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
            //use on change to check the new value
            
            .onChange(of: isFavorite){ _, newValue in
                guard useAnimation == true && newValue == true else{ return }
                //proces if guard condition is true, in this if useAnimation = true and newValue = true, no action. Otherwise run below codes
                
                withAnimation(.spring(response:0.5, dampingFraction: 0.3)){
                    scale = 1.2
                    opacity = 1
                }
                //float and vanish
                withAnimation(.easeInOut(duration:0.5).delay(0.5)){
                    offsetY = -100
                    opacity = 0
                }
                //reset
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    offsetY = 0
                    scale = 1
                    
                }
            }
        }
    }
}

//#Preview {
//    favoritToggle()
//}
