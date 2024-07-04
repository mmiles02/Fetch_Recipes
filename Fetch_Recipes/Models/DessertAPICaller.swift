//
//  DessertAPICaller.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation

class DessertAPICaller {
    
    static func loadDesserts() async throws -> [Dessert] {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        if let url {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Desserts.self, from: data)
            return response.meals
        } else {
            return []
        }
    }
    
//    static func loadRecipe() async throws -> Recipe {
//
//    }
}
