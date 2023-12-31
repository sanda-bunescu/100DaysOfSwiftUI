import CoreData
import Foundation

class DateController{
    let container = NSPersistentContainer(name: "Bookworm")

    init(){
    
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolve Error: \(error)")
            }
        }
    }
}
