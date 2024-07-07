//
//  DessertViewModel.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation
import SwiftUI

class DessertViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    
    @Published var loadError: String = ""
    
    @Published var imageCache: [String: Image] = [:]
    
    /// Loads the dessert array to the view model
    func loadDesserts() async {
        do {
            let loadedDesserts = try await DessertAPICaller.loadDesserts()
            
            // Update the view model on the main thread
            await MainActor.run {
                desserts = cleanAndSortDessertData(desserts: loadedDesserts)
            }
        } catch {
            loadError = error.localizedDescription
        }
    }
    
    /// Removes null dessert data, and guarantees that it is sorted in alphabetical order
    /// - Parameter desserts: Array of desserts to be cleaned and sorted
    /// - Returns: Cleaned and sorted array of desserts
    func cleanAndSortDessertData(desserts: [Dessert]) -> [Dessert] {
        var cleanedDesserts = desserts.filter({
            !$0.id.isEmpty && !$0.name.isEmpty && !$0.thumbnailURL.isEmpty
        })
        
        cleanedDesserts.sort {
            $0.name.lowercased() < $1.name.lowercased()
        }
        
        return cleanedDesserts
    }
    
    /// Loads a recipe ingredients and instructions given a dessert ID
    /// - Parameter dessertID: String ID of the dessert recipe to be loaded
    /// - Returns: The recipe object containing the dessert instruction information
    func loadRecipe(dessertID: String) async -> Recipe? {
        do {
            return try await DessertAPICaller.loadRecipe(dessertID: dessertID)
        } catch {
            loadError = error.localizedDescription
        }
        return nil
    }
    
    /// Loads image to display. If image is cached, return cached image
    /// - Parameter url: URL of image to load
    /// - Returns: Image to display in view
    func loadImage(url: String) async -> Image? {
        if let cachedImage = imageCache[url] {
            return cachedImage
        } else {
            do {
                let image = try await DessertAPICaller.loadImage(url: url)
                if let image {
                    imageCache[url] = image
                    return image
                } else {
                    return nil
                }
            } catch {
                return nil
            }
        }
    }
}
