//
//  RecipeView.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/4/24.
//

import SwiftUI

struct RecipeView: View {
    
    @EnvironmentObject var viewModel: DessertViewModel
    
    @State private var recipe: Recipe?
    @State var titleAndImageHeight: CGFloat = 0
    @State var image: Image?
    
    private var backgroundColor: Color = Color(red: 209/255, green: 223/255, blue: 227/255)
    private var textColor: Color = Color(red: 10/255, green: 74/255, blue: 92/255)
    
    private var dessertID: String
    
    public init(dessertID: String) {
        self.dessertID = dessertID
    }
    
    var body: some View {
        VStack {
            if let recipe {
                ZStack {
                    // Recipe name height placeholder and image
                    VStack {
                        HStack {
                            Text(recipe.name)
                                .font(.title)
                                .foregroundStyle(textColor)
                                .bold()
                                .hidden()
                            Spacer()
                        }
                        .padding(.horizontal)
                        if let image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(.horizontal)
                                .modifier(GetHeightModifier(height: $titleAndImageHeight))
                        }
                        Spacer()
                    }
                    // Recipe name and instructions card
                    VStack {
                        HStack {
                            Text(recipe.name)
                                .font(.title)
                                .foregroundStyle(textColor)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        ScrollView {
                            Spacer()
                                .frame(height: titleAndImageHeight + 25)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(DessertStrings.ingredients)
                                        .font(.title)
                                        .foregroundStyle(textColor)
                                        .bold()
                                    Spacer()
                                }
                                Spacer()
                                    .frame(height: 10)
                                ForEach(recipe.measurements, id:\.self) { measurement in
                                    let ingredient = measurement.ingredient.trimmingCharacters(in: .whitespaces)
                                    let amount = measurement.amount.trimmingCharacters(in: .whitespaces)
                                    if (!ingredient.isEmpty || !amount.isEmpty) {
                                        Text("• \(amount) \(ingredient)")
                                            .foregroundStyle(textColor)
                                    }
                                }
                                Spacer()
                                    .frame(height: 30)
                                HStack {
                                    Text(DessertStrings.instructions)
                                        .font(.title)
                                        .foregroundStyle(textColor)
                                        .bold()
                                    Spacer()
                                }
                                Spacer()
                                    .frame(height: 10)
                                Text(recipe.instructions)
                                    .foregroundStyle(textColor)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(backgroundColor)
                                    .shadow(radius: 5)
                            )
                            .padding(.horizontal)
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                recipe = await viewModel.loadRecipe(dessertID: dessertID)
                
                // Load image (should be cached already)
                if let recipe {
                    image = await viewModel.loadImage(url: recipe.thumbnailURL)
                }
            }
        }
    }
}

struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}

#Preview {
    RecipeView(dessertID: "53049")
        .environmentObject(DessertViewModel())
}
