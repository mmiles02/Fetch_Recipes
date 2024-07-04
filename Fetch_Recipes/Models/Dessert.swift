//
//  Dessert.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation

struct Desserts: Decodable {
    let meals: [Dessert]
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
}

struct Dessert: Decodable, Identifiable {
    let id: String
    let name: String
    let thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }
}
