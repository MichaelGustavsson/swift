//
//  ValuationListDelegate.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import Foundation

protocol ValuationListDelegate: class {
    func update(task: ValuationModel, index: Int)
    func save(valuation: ValuationModel)
}
