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
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let comments = try JSONDecoder().decode([ProductComments].self, from: data)
        
        DispatchQueue.main.async {
            self.comments = comments // published obeservers working on main thread
        }
        
    }
    
}
