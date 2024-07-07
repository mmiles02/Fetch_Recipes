//
//  Recipe.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation

struct Recipes: Decodable {
    let meals: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
}

struct Recipe: Codable, Hashable {
    let id: String
    let name: String
    let instructions: String
    let thumbnailURL: String
    
    // Ingredients
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    // Measurements
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    var measurements: [Measurement] {
        get {
            let allMeasurements = [
                Measurement(ingredient: strIngredient1 ?? "", amount: strMeasure1 ?? ""),
                Measurement(ingredient: strIngredient2 ?? "", amount: strMeasure2 ?? ""),
                Measurement(ingredient: strIngredient3 ?? "", amount: strMeasure3 ?? ""),
                Measurement(ingredient: strIngredient4 ?? "", amount: strMeasure4 ?? ""),
                Measurement(ingredient: strIngredient5 ?? "", amount: strMeasure5 ?? ""),
                Measurement(ingredient: strIngredient6 ?? "", amount: strMeasure6 ?? ""),
                Measurement(ingredient: strIngredient7 ?? "", amount: strMeasure7 ?? ""),
                Measurement(ingredient: strIngredient8 ?? "", amount: strMeasure8 ?? ""),
                Measurement(ingredient: strIngredient9 ?? "", amount: strMeasure9 ?? ""),
                Measurement(ingredient: strIngredient10 ?? "", amount: strMeasure10 ?? ""),
                Measurement(ingredient: strIngredient11 ?? "", amount: strMeasure11 ?? ""),
                Measurement(ingredient: strIngredient12 ?? "", amount: strMeasure12 ?? ""),
                Measurement(ingredient: strIngredient13 ?? "", amount: strMeasure13 ?? ""),
                Measurement(ingredient: strIngredient14 ?? "", amount: strMeasure14 ?? ""),
                Measurement(ingredient: strIngredient15 ?? "", amount: strMeasure15 ?? ""),
                Measurement(ingredient: strIngredient16 ?? "", amount: strMeasure16 ?? ""),
                Measurement(ingredient: strIngredient17 ?? "", amount: strMeasure17 ?? ""),
                Measurement(ingredient: strIngredient18 ?? "", amount: strMeasure18 ?? ""),
                Measurement(ingredient: strIngredient19 ?? "", amount: strMeasure19 ?? ""),
                Measurement(ingredient: strIngredient20 ?? "", amount: strMeasure20 ?? "")
            ]
            
            // Filter out all the empty values
            return allMeasurements.filter({
                !($0.amount.isEmpty && $0.ingredient.isEmpty)
            })
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case thumbnailURL = "strMealThumb"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
}

struct Measurement: Hashable {
    let ingredient: String
    let amount: String
}
