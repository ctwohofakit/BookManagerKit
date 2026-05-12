//
//  ColorCapsule.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/9/26.
//

import SwiftUI

struct ColoredCapsule: View {
    var text: String
    var color: Color = .accentColor
    
    var body: some View{
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.3))
            .clipShape(Capsule())
    }
}
