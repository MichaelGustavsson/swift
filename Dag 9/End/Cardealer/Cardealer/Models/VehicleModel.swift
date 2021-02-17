//
//  VehicleModel.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

struct VehicleModel: VehicleProtocol, CommentProtocol {
    var regNo: String
    var comment: String
    var make: String
    var model: String
    var modelYear: Int
    var mileage: Int
    
    init(regNo: String, make: String, model: String, modelYear: Int, mileage: Int, comment: String) {
        self.make = make
        self.model = model
        self.modelYear = modelYear
        self.mileage = mileage
        self.comment = comment
        self.regNo = regNo
    }
    
}
