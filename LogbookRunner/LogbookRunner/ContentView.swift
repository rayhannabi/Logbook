//
//  ContentView.swift
//  LogbookRunner
//
//  Created by Rayhan Nabi on 12/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Output") {
                    Label("Xcode console", systemImage: "hammer")
                    Label("Unified Logging System", systemImage: "doc.plaintext")
                }
                
                Section("Log Levels") {
                    Text("📓 Default")
                    Text("📗 Debug")
                    Text("📕 Error")
                    Text("📙 Fault")
                    Text("📘 Info")
                    Text("🏷 Tag")
                }
                
                Section("Modules") {
                    Text("Built-in module")
                    Text("Custom module")
                }
            }
            .navigationTitle("Logbook")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
