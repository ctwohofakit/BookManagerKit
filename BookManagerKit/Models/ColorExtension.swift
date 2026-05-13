//
//  ColorExtension.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/12/26.
//

import SwiftUI

extension Color: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self = .primary
            return
        }
        do {
            if let color = try NSKeyedUnarchiver.unarchivedObject(
                ofClass: UIColor.self,
                from: data
            ) {
                self = Color(color)
            } else {
                self = .primary
            }
        } catch {
            self = .primary
        }
    }
    
    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
}
