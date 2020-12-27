//
//  ContentView.swift
//  NavigateOnAppear
//
//  Created by Tobias Tiemerding on 27.12.20.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Text("Second")
            .navigationBarTitle("Second", displayMode: .inline)
            .onAppear(perform: {
                print("Second: onAppear")
            })
    }
}
struct FirstView: View {
    @State var linkActive = false

    
    var body: some View {
        NavigationLink(destination: SecondView(), isActive: $linkActive) {
            Text("Goto second")
        }
        .navigationBarTitle("First", displayMode: .inline)
        .onAppear(perform: {
            print("First: onAppear")
            linkActive = true
        })
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: FirstView()) {
                Text("Goto first")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
