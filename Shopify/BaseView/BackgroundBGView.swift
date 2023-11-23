//
//  BackgroundBGView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI

struct BackgroundBGView: View {
    var body: some View {
       Image("BG")
            .resizable()
//            .scaledToFill()
            .ignoresSafeArea()
//            .overlay(.ultraThinMaterial)
           
    }
}

#Preview {
    BackgroundBGView()
}
