//
//  BackgroundBGView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI

//MARK: - Common background image-
struct BackgroundBGView: View {
    var body: some View {
       Image("BG")
            .resizable()
            .ignoresSafeArea()
           
    }
}

#Preview {
    BackgroundBGView()
}
