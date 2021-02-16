//
//  ValuationProtocol.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

enum ValuationStatusEnum {
    case New
    case Valued
    case Bought
    case Rejected
}

protocol ValuationProtocol {
    var valuationDate: Date { get set }
    var value: Int { get set }
    var status: ValuationStatusEnum { get set }
    var vehicle: VehicleModel { get set }
}
