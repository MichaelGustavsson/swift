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
        
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
