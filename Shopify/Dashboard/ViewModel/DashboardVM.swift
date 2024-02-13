//
//  DashboardVM.swift
//  Shopify
//
//  Created by sahil on 21/11/23.
//

import Foundation
import SwiftUI

class DashboardVM : ObservableObject{
   
    //MARK: - variables with property wrapper-
    @Published var productsList : [Product] = []
    
    
    //MARK: - Get random products from API-
    func getProducts()async throws {
           guard let url = URL(string: Constant.Endpoints.getProductURL) else {
               return
           }
           
           NetworkManager.shared.fetchData(from: url) { (result: Result<[Product], Error>) in
               switch result {
               case .success(let products):
                   DispatchQueue.main.async {
                       self.productsList = products
                   }
               case .failure(let error):
                   print("Error fetching products: \(error)")
               }
           }
       }
    
}




