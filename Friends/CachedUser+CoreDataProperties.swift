//
//  CachedUser+CoreDataProperties.swift
//  Friends
//
//  Created by Sanda Bunescu on 23.11.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    public var wrappedId: UUID{
        UUID(uuidString: id ?? "") ?? UUID()
    }
    public var wrappedAge: Int{
        Int(age)
    }
    public var wrappedAddress: String{
        address ?? "Unknown address"
    }
    public var wrappedAbout: String{
        about ?? "Unknown info"
    }
    public var wrappedCompany: String{
        company ?? "Unknown company"
    }
    public var wrappedEmail: String{
        email ?? "Unknown email"
    }
    public var wrappedName: String{
        name ?? "Unknown name"
    }
    public var wrappedRegisterDate: Date{
        registered ?? Date()
    }
    public var wrappedTags: [String]{
        tags?.components(separatedBy: ",") ?? []
    }
    public var wrappedFriends: [CachedFriend]{
        let friendsList = friends as? Set<CachedFriend> ?? []
        return friendsList.sorted{
            $0.wrappedName < $1.wrappedName
        }
    }
    
    
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
