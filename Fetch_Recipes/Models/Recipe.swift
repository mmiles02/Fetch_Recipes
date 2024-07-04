//
//  Recipe.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation

struct Recipe: Codable, Hashable {
    let id: Int
    let name: String
    let drinkAlternate: String?
    let category: String
    let cuisine: String
    let instructions: String
    let thumbnailURL: String
    let tags: String?
}
