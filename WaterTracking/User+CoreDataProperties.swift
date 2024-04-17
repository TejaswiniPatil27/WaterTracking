//
//  User+CoreDataProperties.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var weight: String?
    @NSManaged public var waterIntake: String?
    @NSManaged public var totalWaterIntake: String?

}

extension User : Identifiable {

}
