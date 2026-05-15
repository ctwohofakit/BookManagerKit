//
//  SettingsView.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/12/26.
//

import SwiftUI

struct SettingsView: View {
  
    //persistence data
    
    //use app storage manager, it save the setting , so it does not keep changing when close the app
    @AppStorage(SETTINGS_THEME) private var theme: Theme = .system
    
    //stoarge pivate varible name "theme" to get: the enum "Theme" value, and defult = the value system, here the .system is Theme. system
    
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns:Int = 2
    
    @AppStorage(SETTINGS_SHOW_RATING) private var showRating: Bool = SETTINGS_SHOW_RATING_VALUE
    
    @AppStorage(SETTINGS_TINT_COLOR) private var tintColor: Color = SETTINGS_TINT_COLOR_VALUE
    
    @AppStorage(SETTINGS_SHOW_STATUS) private var showStatus: Bool = SETTINGS_SHOW_STATUS_VALUE
    
    @AppStorage(SETTINGS_TITLE_SIZE) private var titleSize: TitleSize = SETTINGS_TITLE_SIZE_VALUE
    
  
    
    
    var body: some View {
        //
        NavigationStack{
            Form{
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $theme){
                        ForEach(Theme.allCases, id: \.self) {theme in
                            Text(theme.rawValue).tag(theme)
                        }
                        
                    }
                    ColorPicker("Accent color", selection: $tintColor)
                }//end of appearance section
                Section(header: Text("Grid")){
                    Stepper("Column: \(gridColumns)", value: $gridColumns, in: 1...4)
                        
                        
                    
                }
                Section(header: Text("List")){
                    Toggle(isOn: $showRating){
                        Text("Show rating")
                    }
                }
                // assignment 3
                Section(header: Text("List Settings")){
                    Toggle(isOn: $showStatus){
                        Text("Show reading status")
                    }
                    
                    Picker("Title Size", selection: $titleSize){
                        ForEach(TitleSize.allCases, id: \.self) { size in
                            Text(size.rawValue).tag(size)
                        }
                    }

                }
                
 
            }
        }
        
        
    }
}
#Preview {
    
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
