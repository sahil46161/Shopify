//
//  ProductModel.swift
//  Shopify
//
//  Created by sahil on 21/11/23.
//

import Foundation


struct Product: Codable,Identifiable {
    var albumID, id: Int
    var title: String
    var url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
