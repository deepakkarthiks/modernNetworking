//
//  ContentView.swift
//  modernNetworking
//
//  Created by Deepak Karthik S on 12/07/20.
//  Copyright © 2020 Deepak Karthik S. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.recipes) { recipe in
            HStack {
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.headline)
                    Text(recipe.ingredients)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
