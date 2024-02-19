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
            NavigationLink(destination: RaceModeView()) {
                Text("Race")
                    .font(.system(size: 20))
            }
            NavigationLink(destination: TrainingModeView()) {
                Text("Training")
                    .font(.system(size: 20))
            }
            .navigationTitle("Choose mode")
            .containerBackground(.blue.gradient, for: .navigation)
        }
    }
}

#Preview{
    MainView()
}
