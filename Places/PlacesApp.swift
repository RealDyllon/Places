//
//  PlacesApp.swift
//  Places
//
//  Created by Dyllon on 24/6/22.
//

import SwiftUI

@main
struct PlacesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
