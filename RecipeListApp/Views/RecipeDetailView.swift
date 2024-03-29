//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Esperanza on 2022-10-13.
//

import SwiftUI

struct RecipeDetailView: View {
  
  var recipe: Recipe
  
  @State var selectedServingSize = 2
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        // MARK: Recipe Image
        Image(recipe.image)
          .resizable()
          .scaledToFill()
        
        // MARK: Recipe title
        Text("")
          .bold()
          .padding(.top, 20)
          .padding(.leading)
          .font(.largeTitle)
        
        // MARK: Serving Size Picker
        VStack(alignment: .leading) {
          Text("Selected your serving size.")
          Picker("", selection: $selectedServingSize) {
            Text("2").tag(2)
            Text("4").tag(4)
            Text("6").tag(6)
            Text("8").tag(8)
          }
          .pickerStyle(.segmented)
          .frame(width: 160)
        }.padding()
        
        // MARK: Recipe Ingredients
        VStack(alignment: .leading) {
          Text("Ingredients")
            .font(.headline)
            .padding([.bottom, .top], 5)
          ForEach(recipe.ingredients) { item in
            Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
          }
        }
        .padding(.horizontal)
        
        // MARK: Divider
        
        // MARK: Recipe Directions
        VStack(alignment: .leading) {
          Text("Directions")
            .font(.headline)
            .padding([.bottom, .top], 5)
          ForEach(0..<recipe.directions.count - 1, id: \.self) {
            index in
            Text(String(index + 1) + ". " + recipe.directions[index])
              .padding(.bottom, 5)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
      
      // Create a dummy recipe and pass it into the detail view so that we can see a preview
      
      let model = RecipeModel()
      
      RecipeDetailView(recipe: model.recipes[0])
    }
}
