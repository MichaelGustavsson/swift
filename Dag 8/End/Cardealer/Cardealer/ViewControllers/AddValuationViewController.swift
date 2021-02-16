//
//  AddValuationViewController.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import UIKit

class AddValuationViewController: UIViewController {

    weak var delegate: ValuationListDelegate?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var modelYearField: UITextField!
    @IBOutlet weak var mileageField: UITextField!
    @IBOutlet weak var commentField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.commentField.layer.borderWidth = 1
        self.commentField.layer.borderColor = UIColor.lightGray.cgColor

        let item = UINavigationItem(title: "Nytt Fordon")
        item.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAdd))
        navigationBar.items = [item]
    }
    
    
    @objc func cancelAdd() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        let vehicle = VehicleModel(make: self.makeField.text ?? "",
                                   model: self.modelField.text ?? "",
                                   modelYear: Int(self.modelYearField.text!) ?? 0,
                                   mileage: Int(self.mileageField.text!) ?? 0,
                                   comment: self.commentField.text)
        
        let valuation = ValuationModel(status: .New, vehicle: vehicle, comment: "")
        
        delegate?.save(valuation: valuation)
        dismiss(animated: true, completion: nil)
    }
    
}
