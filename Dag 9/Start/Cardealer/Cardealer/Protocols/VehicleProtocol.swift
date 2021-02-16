//
//  VehicleProtocol.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

protocol VehicleProtocol {
    var make: String { get set }
    var model: String { get set }
    var modelYear: Int { get set }
    var mileage: Int { get set }
}
