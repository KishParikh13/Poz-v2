//
//  Note+CoreDataProperties.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/14/21.
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
    @NSManaged public var img: Data?
    @NSManaged public var note: String?
    @NSManaged public var stringLength: Double

}

extension Note : Identifiable {

}
