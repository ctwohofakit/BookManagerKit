//
//  BookManagerKitApp.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 4/28/26.
//

import SwiftUI
import SwiftData

@main
struct BookManagerKitApp: App {

    
    let modelContainer: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    
    }
    
    init(){
        do {
            modelContainer = try ModelContainer(for: PersistentBook.self
            )
        } catch {
            fatalError("Failed to load model container")
        }
    }
    
}


