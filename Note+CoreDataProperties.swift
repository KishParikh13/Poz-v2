//
//  Note+CoreDataProperties.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/4/21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var date: String?
    @NSManaged public var emoji: String?
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var stringLength: Double
    @NSManaged public var user: User?
    
    public var wrappedCreatedTime: Date {
        createdAt ?? Date()
    }
    public var wrappedDate: String {
        date ?? "Unknown Note"
    }
    public var wrappedEmoji: String {
        emoji ?? "😶"
    }
    public var wrappedID: UUID {
        id ?? UUID()
    }
    public var wrappedNote: String {
        note ?? "Unknown Note"
    }
    public var wrappedLength: Double {
        stringLength
    }
}

extension Note : Identifiable {

}
