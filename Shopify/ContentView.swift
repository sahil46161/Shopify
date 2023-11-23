//
//  ContentView.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import SwiftUI

//This is a test for branch protection rules

struct ContentView: View {
    @Namespace private var namespace
    @State var isClicked = false
    var body: some View {
               LoginView()
//        VStack {
//            if !isClicked {
//                Circle()
//                    .matchedGeometryEffect(id: "circle", in: namespace)
//                    .frame(maxWidth: 100, maxHeight: 100)
//            }
//            Spacer()
//            if isClicked {
//                HStack{
//                    Rectangle()
//                        .matchedGeometryEffect(id: "circle", in: namespace)
//                        .frame(maxWidth: 80, maxHeight: 80)
////                    Spacer()
//                }
//            }
//        }
//        .onTapGesture {
//            withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
//                isClicked.toggle()
//            }
//        }
    }
    
}

#Preview {
    ContentView()
}
