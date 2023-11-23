//
//  ProfileImageView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI

struct ProfileImage: View {
    
    @State private var scaling = true
    private var needAnimation = false

    init( needAnimation: Bool = false) {
        self.needAnimation = needAnimation
    }
    
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 32, height: 32)
            .aspectRatio( contentMode: .fit)
            .clipShape(Rectangle() )
//            .shadow(radius: 5)
            .scaleEffect(scaling ? 0.8 : 1)
            .foregroundColor(.gray.opacity(0.5))
        
            .onAppear{
                if needAnimation{
                    withAnimation(
                        .spring()
                        .repeatForever()) {
                            scaling.toggle()
                        }
                        
                }
                
            }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
