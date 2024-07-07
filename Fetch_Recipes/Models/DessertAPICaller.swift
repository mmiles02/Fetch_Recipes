//
//  DessertAPICaller.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation
import SwiftUI

class DessertAPICaller {
    
    /// Loads the dessert array from the URL and parses the JSON into client objects
    /// - Returns: The array of desserts
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
    
    /// Loads the recipe from the URL and parses the JSON into client objects
    /// - Parameter dessertID: The dessert ID of the recipe
    /// - Returns: The client recipe object
    static func loadRecipe(dessertID: String) async throws -> Recipe? {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessertID)")
        if let url {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Recipes.self, from: data)
            return response.meals[0]
        }
        return nil
    }
    
    /// Loads an image from a given url
    /// - Parameter url: The url of the image to load
    /// - Returns: The image to display, if a valid URL
    static func loadImage(url: String) async throws -> Image? {
        let url = URL(string: url)
        if let url {
            let (data, _) = try await URLSession.shared.data(from: url)
            let image = UIImage(data: data)
            if let image {
                return Image(uiImage: image)
            }
        }
        
        return nil
    }
}
