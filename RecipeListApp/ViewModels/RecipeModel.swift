//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Esperanza on 2022-10-12.
//

import Foundation

class RecipeModel: ObservableObject {
  
  @Published var recipes = [Recipe]()
  
  init() {
    // Create an instance of data service and get the data
    self.recipes = DataService.getLocalData()

    // Set the recipes property
    
  }
  
}
