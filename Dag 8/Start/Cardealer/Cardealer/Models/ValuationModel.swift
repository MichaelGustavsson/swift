//
//  ValuationModel.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

struct ValuationModel: ValuationProtocol {
    var valuationDate: Date
    var value: Int
    var status: ValuationStatusEnum
    var vehicle: VehicleModel
    
    init(status: ValuationStatusEnum, vehicle: VehicleModel) {
        self.status = status
        self.vehicle = vehicle
        valuationDate = Date()
        value = 0
    }
}
