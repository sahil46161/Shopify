//
//  ProductCommentModal.swift
//  Shopify
//
//  Created by sahil on 22/11/23.
//

import Foundation


struct ProductComments: Codable , Identifiable{
    var postID, id: Int
    var name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
