//
//  APIHandler.swift
//  Shopify
//
//  Created by sahil on 13/02/24.
//

import Foundation
class NetworkManager {
    // Singleton instance
    static let shared = NetworkManager()
    
    // Private initializer to prevent external instantiation
    private init() {}
    
    // Method to fetch data from a URL
    func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        // Create URL request
        let urlRequest = URLRequest(url: url)
        
        // Initiate data task for fetching data from URL
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Check for errors
            if let error = error {
                // Handle error case
                completion(.failure(error))
                return
            }
            
            // Ensure data is received
            guard let data = data else {
                // Handle case where no data is received
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            // Check HTTP response status code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                // Handle invalid response
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
            
            // Decode received data
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                // Call completion handler with success result
                completion(.success(decodedData))
            } catch {
                // Handle decoding error
                completion(.failure(error))
            }
        }.resume() // Resume the data task
    }
}
