//
//  CachedFriend+CoreDataProperties.swift
//  Friends
//
//  Created by Sanda Bunescu on 23.11.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var userFriend: CachedUser?

    public var wrappedId: UUID{
        UUID(uuidString: id ?? "") ?? UUID()
    }
    public var wrappedName: String{
        name ?? "Unknown name"
    }
}

extension CachedFriend : Identifiable {

}
