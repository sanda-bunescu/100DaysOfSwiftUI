
import SwiftUI

@main
struct FriendsApp: App {
    var body: some Scene {
        let controller = PersistenceController()
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
