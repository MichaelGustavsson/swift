//
//  VehicleModels+CoreDataProperties.swift
//  Storage
//
//  Created by Michael Gustavsson on 2021-03-02.
//
//

import Foundation
import CoreData


extension VehicleModels {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VehicleModels> {
        return NSFetchRequest<VehicleModels>(entityName: "VehicleModels")
    }

    @NSManaged public var name: String?
    @NSManaged public var make: Manufacturer?

}

extension VehicleModels : Identifiable {

}
