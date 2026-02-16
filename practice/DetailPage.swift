//
//  DetailPage.swift
//  practice
//
//  Created by senthil on 16/02/26.
//

import SwiftUI

struct DetailPage: View {
    
    let receivedImage: Image

    
    var body: some View {
        
        VStack{
            
            receivedImage
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
            
            
            
        }
        .navigationTitle("Detail")
    }

}
