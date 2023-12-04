import CoreData
import Foundation

struct PersistenceController {

    let container = NSPersistentContainer(name: "UsersData")

    init() {
        container.loadPersistentStores{ storeDescription, error in
            if let error = error {
                fatalError("Unresolve Error: \(error)")
            }
            
        }
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
    }
}
