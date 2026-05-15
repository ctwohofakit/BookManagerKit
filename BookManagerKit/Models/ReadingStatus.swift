//
//  ReadingStatus.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/9/26.
//

import SwiftUI

public enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case planToRead = "Plan to read"
    case reading = "Reading"
    case finsihed = "Finished"
    case dropped = "Dropped"
    case unknown = "Unknown"
    
//    var statusBackground: Color{
//        switch self{
//        case .planToRead : return .yellow
//        case .reading : return .brown
//        case .finsihed : return .green
//        case .dropped : return .red
//        case .unknown : return .primary
//        default : return .primary
//        }
//    }

}
