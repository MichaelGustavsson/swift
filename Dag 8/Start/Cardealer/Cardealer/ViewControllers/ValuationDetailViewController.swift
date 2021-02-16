//
//  ValuationDetailViewController.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import UIKit

class ValuationDetailViewController: UIViewController {
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var modelYearLabel: UILabel!
    @IBOutlet weak var valueField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    var valuation: ValuationModel!
    var valuationIndex: Int!
    weak var delegate: ValuationListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.makeLabel.text = valuation.vehicle.make
        self.modelLabel.text = valuation.vehicle.model
        self.modelYearLabel.text = "\(valuation.vehicle.modelYear)"
        self.mileageLabel.text = "\(valuation.vehicle.mileage)"
    }
    

    @IBAction func addValuationButton(_ sender: UIButton) {
        valuation.status = .Valued
        //valuation.value = self.valueField.text
        delegate?.update(task: valuation, index: valuationIndex)
        
        disableButton()
    }
    
    func disableButton() {
        doneButton.backgroundColor = UIColor.gray
        doneButton.isEnabled = false
    }

}
