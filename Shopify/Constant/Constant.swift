//
//  Constant.swift
//  Shopify
//
//  Created by sahil on 16/11/23.
//

import Foundation
import UIKit

struct Constant{
    struct AppImages{
        static let apppLogo = "shopifyLogo"
        static let menu = "menu"
        static let audioIcon = "audioIcon"
        static let cart = "cart"
        
    }

    
    struct AppFonts{
        static let Roboto_Regular = "Roboto-Regular"
        static let Roboto_Bold = "Roboto-Bold"
        static let Roboto_Italic = "Roboto-Italic"
        static let Roboto_Black = "Roboto-Black"
        static let Roboto_Medium = "Roboto-Medium"
    }
    
    
    struct AppColors {
        static let greenDefault = "0ACF83"
        static let lightGray = "F6F6F6"
    }
    
    
    
    struct Endpoints {
        static let getCommentsURL = "https://jsonplaceholder.typicode.com/posts/1/comments"
        static let getProductURL = "https://jsonplaceholder.typicode.com/photos?_page=1&_limit=20"
        static let getRandomImage100x100 = "https://picsum.photos/100/100"
        static let getRandomImage300x300 = "https://picsum.photos/300/300"
        static let getRandomImage120x140 = "https://picsum.photos/120/140"
    }
    
    
    struct StringTitles {
        static let name = "Hey, Andrea"
        static let lookingFor = "What are you looking for today?"
        static let audioTitle = "Audio"
        static let modularDesign = "It's modular and designed to last"
    }
    
}
