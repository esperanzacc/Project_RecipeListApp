//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Esperanza on 2022-10-12.
//

import SwiftUI

struct RecipeListView: View {
  
  // Reference the view model
  @ObservedObject var model = RecipeModel()
  
    var body: some View {
    
      List(model.recipes) { r in
        HStack(spacing: 20.0) {
          Image(r.image)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50, alignment: .center)
            .clipped()
            .cornerRadius(5)
          Text(r.name)
        }

      }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
