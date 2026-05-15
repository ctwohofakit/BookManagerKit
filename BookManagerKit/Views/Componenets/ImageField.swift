//
//  ImageField.swift
//  BookManagerKit
//
//  Created by Kit Sitou on 5/14/26.
//

import SwiftUI
import PhotosUI

public struct ImageField: View{
    
    @Binding var imageData: Data?
    @State private var photosPickerItem: PhotosPickerItem?
    
    private var imagePreview: UIImage {
        if let imageData {
            UIImage(data: imageData)!
        }else {
            UIImage(resource: .defaultBook)
        }
    }
    
    public var body: some View{
        PhotosPicker(
            selection: $photosPickerItem, matching: .images,
            photoLibrary: .shared()
        
        ){
            //This is what the picker will display inside
            Image(uiImage: imagePreview)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height:150)
            
        }.onChange(of: photosPickerItem){
            Task{
                if let photosPickerItem,
                   let imageData = try? await photosPickerItem.loadTransferable(type: Data.self){
                    self.imageData = imageData
                }
            }
        }
        
    }
}
