//
//  ProductViewModal.swift
//  Shopify
//
//  Created by sahil on 22/11/23.
//

import Foundation

class ProductViewModal : ObservableObject{
    
    @Published var comments : [ProductComments] = []
    
    func getproductComments() async throws{
        guard let url = URL(string: Constant.Endpoints.getCommentsURL) else { return /*productsList*/ }
        NetworkManager.shared.fetchData(from: url) { (result: Result<[ProductComments], Error>) in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.comments = products
                }
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
        
    }
    
}
