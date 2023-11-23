//
//  OverlayModifier.swift
//  Shopify
//
//  Created by sahil on 17/11/23.
//

import SwiftUI

struct OverlayModifier<OverlayView: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let overlayView: OverlayView
    
    init(isPresented: Binding<Bool>, @ViewBuilder overlayView: @escaping () -> OverlayView) {
        self._isPresented = isPresented
        self.overlayView = overlayView()
    }
    
    func body(content: Content) -> some View {
        content.overlay(isPresented ? overlayView : nil)
    }
}

extension View {
    
    func popup<OverlayView: View>(isPresented: Binding<Bool>,
                                  blurRadius: CGFloat = 5,
                                  blurAnimation: Animation? = .bouncy,
                                  @ViewBuilder overlayView: @escaping () -> OverlayView) -> some View {
        return blur(radius: isPresented.wrappedValue ? blurRadius : 0)
            .animation(blurAnimation)
            .allowsHitTesting(!isPresented.wrappedValue)
            .modifier(OverlayModifier(isPresented: isPresented, overlayView: overlayView))
    }
}
