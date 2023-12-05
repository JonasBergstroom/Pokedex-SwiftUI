//
//  ContentView.swift
//  Pokedex-SwiftUI
//
//  Created by Jonas Bergström on 2023-11-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
