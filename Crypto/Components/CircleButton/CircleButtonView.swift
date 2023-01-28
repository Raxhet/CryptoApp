//
//  CircleButtonView.swift
//  Crypto
//
//  Created by Илья Меркуленко on 27.01.2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 40, height: 40)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.3),
                radius: 10)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "info")
                .previewLayout(.fixed(width: 100, height: 100))
            
            CircleButtonView(iconName: "plus")
                .previewLayout(.fixed(width: 100, height: 100))
                .preferredColorScheme(.dark)
                
        }
    }
}
