//
//  CartViewModel.swift
//  Shopify
//
//  Created by sahil on 23/11/23.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartItems : [CartItemsModel] = []
    @Published var count = 0
    
}
