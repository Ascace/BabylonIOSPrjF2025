//
//  SwearchView.swift
//  Babylon
//
//  Created by user278698 on 11/6/25.
//

import SwiftUI

struct SwearchView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack{
            HStack{
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            TextField("Search For furniture", text: $search )
                .padding()
        }
        .background(Color("kSecondary"))
        .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
            
        
    }
        .padding(.horizontal)
}
    
}

#Preview {
    SwearchView()
}
