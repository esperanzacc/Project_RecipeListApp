//
//  RecipeFeatureView.swift
//  RecipeListApp
//
//  Created by Esperanza on 2023-02-23.
//

import SwiftUI

struct RecipeFeatureView: View {
  
  @EnvironmentObject var model: RecipeModel
  
    var body: some View {
      
      VStack(alignment: .leading, spacing: 0) {
        
        Text("Featured Recipes")
          .padding(.leading)
          .padding(.top, 40)
          .font(.largeTitle)
          .bold()
        
        GeometryReader { geo in
          TabView {
            
            // Loop through each recipe
            ForEach(0..<model.recipes.count) { index in
              
              // only show those that should be featured
              if model.recipes[index].featured == true {
                
                // Recipe card
                ZStack {
                  Rectangle()
                    .foregroundColor(.white)
          
                  VStack(spacing: 0) {
                    Image(model.recipes[index].image)
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .clipped()
                    Text(model.recipes[index].name)
                      .padding(5)
                    
                  }
                }
                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                
              }
              
            }
    
          }
          .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
          .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
          
        }
        
        VStack(alignment: .leading, spacing: 10) {
          
          Text("Preparation Time:")
            .font(.headline)
          Text("1 hour")
          
          Text("Highlights")
            .font(.headline)
          Text("Healthy, Hearty")
        }
        .padding([.leading, .bottom])
      }
      
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
        .environmentObject(RecipeModel())
    }
}
