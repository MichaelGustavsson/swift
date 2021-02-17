//
//  Vehicle+CoreDataProperties.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-16.
//
//

import Foundation
import CoreData


extension Vehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehicle> {
        return NSFetchRequest<Vehicle>(entityName: "Vehicle")
    }

    @NSManaged public var make: String?
    @NSManaged public var model: String?
    @NSManaged public var modelYear: Int32
    @NSManaged public var mileage: Int32
    @NSManaged public var comment: String?
    @NSManaged public var registrationNo: String?

}

extension Vehicle : Identifiable {

}
