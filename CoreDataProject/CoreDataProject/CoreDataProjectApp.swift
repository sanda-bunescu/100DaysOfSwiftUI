//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Sanda Bunescu on 31.10.2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let dateController = DateController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dateController.container.viewContext)
        }
    }
}
