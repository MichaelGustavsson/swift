//
//  VehicleModel.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

struct VehicleModel: VehicleProtocol {
    var make: String
    var model: String
    var modelYear: Int
    var mileage: Int
    
    init(make: String, model: String, modelYear: Int, mileage: Int) {
        self.make = make
        self.model = model
        self.modelYear = modelYear
        self.mileage = mileage
    }
    
}
