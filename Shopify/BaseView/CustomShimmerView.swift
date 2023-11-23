//
//  CustomShimmerView.swift
//  Shopify
//
//  Created by sahil on 21/11/23.
//

import SwiftUI
import ShimmerView

struct CustomShimmerView: View {
    private var width : CGFloat = 100
    private var height : CGFloat = 100
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    
    var body: some View {
        VStack(spacing:0){
//            HStack{
                ShimmerScope(isAnimating: .constant(true)) {
                    VStack() {
                        ShimmerElement(width: width, height: height)
                            .cornerRadius(8)
                    }
                }
//            }
        }.frame(width: width, height: height)
//            .padding()
          
    }
}

#Preview {
    CustomShimmerView(width: UIScreen.screenWidth-123, height: 42)
        
}
