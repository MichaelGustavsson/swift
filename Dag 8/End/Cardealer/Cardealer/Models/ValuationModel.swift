//
//  ValuationModel.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

struct ValuationModel: ValuationProtocol, CommentProtocol {
    var comment: String
    var valuationDate: Date
    var value: Int
    var status: ValuationStatusEnum
    var vehicle: VehicleModel
    
    init(status: ValuationStatusEnum, vehicle: VehicleModel, comment: String) {
        self.status = status
        self.vehicle = vehicle
        valuationDate = Date()
        value = 0
        self.comment = comment
    }
}
