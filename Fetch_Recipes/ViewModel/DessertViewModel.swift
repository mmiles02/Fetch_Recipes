//
//  DessertViewModel.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/3/24.
//

import Foundation

class DessertViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    
    @Published var loadError: String = ""
    
    func loadDesserts() async {
        do {
            let loadedDesserts = try await DessertAPICaller.loadDesserts()
            
            // Update the view model on the main thread
            await MainActor.run {
                desserts = loadedDesserts
            }
        } catch {
            loadError = error.localizedDescription
        }
    }
}
