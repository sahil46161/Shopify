//
//  BottomPopupView.swift
//  Shopify
//
//  Created by sahil on 17/11/23.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                content
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(radius: 16, corners: [.topLeft,.topRight])
                
            }
            .edgesIgnoringSafeArea([.bottom])
        }
        .animation(.easeOut)
        .transition(.move(edge: .bottom))
    }
}



struct RoundedCornersShape: Shape {
    
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    
    func cornerRadius(radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCornersShape(radius: radius, corners: corners))
    }
}
