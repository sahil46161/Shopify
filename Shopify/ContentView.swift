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
    }
    
}

#Preview {
    ContentView()
}
