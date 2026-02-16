//
//  ContentView.swift
//  practice
//
//  Created by senthil on 14/02/26.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        NavigationStack{
            VStack {
                            
                if isPresented {
                    selectedImages[0]
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
              
                
                Spacer(minLength: 150)
                PhotosPicker("Select Image", selection: $selectedItems, maxSelectionCount: 1, matching: .images)
                    .tint(.brown)
                    .buttonStyle(.borderedProminent)
                    

                .onChange(of: selectedItems) {
                    Task {
                        for item in selectedItems {
                            if let image = try? await item.loadTransferable(type: Image.self) {
                                selectedImages.removeAll()
                                selectedImages.append(image)
                                isPresented = true
                            }
                        }
                    }
                }
                
                if isPresented {
                    NavigationLink("Photo Detail", destination: DetailPage(receivedImage: selectedImages[0]))
                        .buttonStyle(.borderedProminent)
                        .tint(.brown)
                }
 
                
            }
            .padding()
        }
    }
}



#Preview {
    ContentView()
}




