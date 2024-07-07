//
//  DessertListView.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/2/24.
//

import SwiftUI

struct DessertListView: View {
    
    @EnvironmentObject var viewModel: DessertViewModel
    
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(searchResults, id: \.id) { dessert in
                        NavigationLink(
                            destination: RecipeView(dessertID: dessert.id)
                                .navigationBarTitleDisplayMode(.inline)
                        ) {
                            DessertCardView(dessert: dessert)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Desserts")
        }
        .searchable(text: $searchText)
        .onAppear {
            Task {
                await viewModel.loadDesserts()
            }
        }
    }
    
    var searchResults: [Dessert] {
        if searchText.isEmpty {
            return viewModel.desserts
        } else {
            return viewModel.desserts.filter { $0.name.uppercased().contains(searchText.uppercased()) }
        }
    }
}

#Preview {
    DessertListView()
        .environmentObject(DessertViewModel())
}
