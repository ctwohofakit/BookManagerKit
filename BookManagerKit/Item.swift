//
//  Item.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
