//
//  DessertCardView.swift
//  Fetch_Recipes
//
//  Created by Mitchell Miles on 7/4/24.
//

import SwiftUI

struct DessertCardView: View {
    
    @EnvironmentObject var viewModel: DessertViewModel
    
    @State private var image: Image?
    
    private var dessert: Dessert
    
    public init(dessert: Dessert) {
        self.dessert = dessert
    }
    
    var body: some View {
        VStack {
            /// I would have used AsyncImage here, but a known bug with AsyncImage and LazyVGrid causes loading errors
            /// https://developer.apple.com/forums/thread/682498
            if let image {
                image
                    .resizable()
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
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(white: 0.8))
                    .aspectRatio(1.0, contentMode: .fit)
                    .overlay(
                        ProgressView()
                    )
            }
        }
        .onAppear {
            Task {
                image = await viewModel.loadImage(url: dessert.thumbnailURL)
            }
        }
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
    .environmentObject(DessertViewModel())
}
