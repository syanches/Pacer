//
//  ContentView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: PickersView()) {
                Text("Pace to splits")
                    .font(.system(size: 20))
            }
            .navigationTitle("Choose mode")
            .containerBackground(.blue.gradient, for: .navigation)
//            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview{
    MainView()
}
