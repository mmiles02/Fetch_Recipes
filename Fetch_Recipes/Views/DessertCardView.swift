//
//  DessertCardView.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/4/24.
//

import SwiftUI

struct DessertCardView: View {
    
    private var dessert: Dessert
    
    public init(dessert: Dessert) {
        self.dessert = dessert
    }
    
    var body: some View {
        AsyncImage(url: URL(string: dessert.thumbnailURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(
            VStack {
                HStack {
                    Text(dessert.name)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 5)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Spacer()
            }
            .padding()
        )
    }
}

#Preview {
    DessertCardView(
        dessert: Dessert(
            id: "53049",
            name: "Apam balik",
            thumbnailURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
        )
    )
}
