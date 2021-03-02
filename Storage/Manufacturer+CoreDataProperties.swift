//
//  Manufacturer+CoreDataProperties.swift
//  Storage
//
//  Created by Michael Gustavsson on 2021-03-02.
//
//

import Foundation
import CoreData


extension Manufacturer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Manufacturer> {
        return NSFetchRequest<Manufacturer>(entityName: "Manufacturer")
    }

    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var models: NSSet?

}

// MARK: Generated accessors for models
extension Manufacturer {

    @objc(addModelsObject:)
    @NSManaged public func addToModels(_ value: VehicleModels)

    @objc(removeModelsObject:)
    @NSManaged public func removeFromModels(_ value: VehicleModels)

    @objc(addModels:)
    @NSManaged public func addToModels(_ values: NSSet)

    @objc(removeModels:)
    @NSManaged public func removeFromModels(_ values: NSSet)

}

extension Manufacturer : Identifiable {

}
