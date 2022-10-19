//
//  DataService.swift
//  RecipeListApp
//
//  Created by Esperanza on 2022-10-12.
//

import Foundation

class DataService {
  
  static func getLocalData() -> [Recipe] {
    // Parse the local JSON file
    
    // Get a url path to the JSON file
    let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
    
    // Check pathString is not nil, otherwise...
    guard pathString != nil else {
      return [Recipe]()
    }
    // Create a url object
    let url = URL(filePath: pathString!)
    do {
      // Create a data object
      let data = try Data(contentsOf: url)
      // Decode the data with a JSON folder
      let decoder = JSONDecoder()
      
      do {
        let recipeData = try decoder.decode([Recipe].self, from: data)
        // Add the unique IDs
        for r in recipeData {
          r.id = UUID()
        }
        // Return the recipes
        return recipeData
      }
      catch {
        // Error with parsing json
        print(error)
      }
    }
    catch {
      // Error with getting data
      print(error)
    }
    
    return [Recipe]()
  }
}
