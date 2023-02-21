//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Esperanza on 2023-02-20.
//

import SwiftUI

struct RecipeTabView: View {
  
    var body: some View {
      
      TabView {
        
        Text("Featured View")
          .tabItem {
              VStack {
                Image(systemName: "star.fill")
                Text("Featured")
              }
            }
        RecipeListView()
          .tabItem {
            Image(systemName: "list.bullet")
            Text("List")
          }
      }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
      RecipeTabView()
    }
}
