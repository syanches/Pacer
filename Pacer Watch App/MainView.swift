//
//  ContentView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: PacePickerView()) {
                Text("Pace to splits")
            }
            .navigationTitle("Choose mode")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
