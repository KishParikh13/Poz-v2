//
//  User+CoreDataProperties.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/4/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var notes: NSSet?

    public var wrappedUserName: String {
        name ?? "Unknown User"
    }
    
    public var noteArray: [Note] {
        let set = notes as? Set<Note> ?? []
        
        return set.sorted {
            $0.wrappedCreatedTime < $1.wrappedCreatedTime
        }
    }
}

// MARK: Generated accessors for notes
extension User {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

    
}

extension User : Identifiable {

}
