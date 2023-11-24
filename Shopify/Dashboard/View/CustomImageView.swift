//
//  CustomImageView.swift
//  Shopify
//
//  Created by sahil on 21/11/23.
//

import SwiftUI
import UIKit
import Foundation

struct ImageView: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    init(urlString: String?) {
        imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    var body: some View {
//        Image(uiImage: imageViewModel.image ?? UIImage())
//            .resizable()
//            .scaledToFill()
        Image("random1")
            .resizable()
            .scaledToFill()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "https://developer.apple.com/news/images/og/swiftui-og.png")
    }
}
