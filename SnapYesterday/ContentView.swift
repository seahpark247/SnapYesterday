//
//  ContentView.swift
//  SnapYesterday
//
//  Created by Seah Park on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var today = ""
    @State private var yesterday = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("How do I feel right now") {
                    TextField("Enter your feelings", text: $today)
                    
                    HStack {
                        Spacer()
                        Button("Save") {
                            UserDefaults.standard.set(today, forKey: "savedSnap")
                        }
                    }
                }
                
                Section("Check snap from yesterday!") {
                    HStack {
                        Spacer()
                        Button("Snap Yesterday") {
                            yesterday = UserDefaults.standard.string(forKey: "savedSnap") ?? "No snap from yesterday!"
                        }
                    }
                    Text(yesterday)
                }
            }
            .navigationTitle("Snap Yesterday")
            .background(.purple.gradient)
        }.scrollContentBackground(.hidden)
    }
}

#Preview {
    ContentView()
}
