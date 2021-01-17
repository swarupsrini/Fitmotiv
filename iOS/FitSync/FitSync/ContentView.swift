//
//  ContentView.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//
import SwiftUI

struct ContentView: View {
    @State private var selection = 0



    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            Analytics()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Analytics")
            }
            Social()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Social")
            }
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
            Workout(screenType: "Workout")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }   // End of TabView
            .font(.headline)
            .imageScale(.medium)
            .font(Font.title.weight(.regular))
        .navigationBarBackButtonHidden(true)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
