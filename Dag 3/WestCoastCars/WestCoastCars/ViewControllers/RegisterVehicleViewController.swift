//
//  RegisterVehicleViewController.swift
//  WestCoastCars
//
//  Created by Michael Gustavsson on 2021-01-27.
//

import UIKit

class RegisterVehicleViewController: UIViewController {

    @IBOutlet weak var regNoField: UITextField!
    @IBOutlet weak var vinNumberField: UITextField!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var mileageField: UITextField!
    @IBOutlet weak var modelYearField: UITextField!
    
    var vehicle: Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regNoField.text = vehicle?.regNo
        vinNumberField.text = ""
        makeField.text = vehicle?.make
        modelField.text = vehicle?.model
        modelYearField.text = String(vehicle!.modelYear)

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        //Logik för att spara ner fordonet någonstans...
        //Gå tillbaka till söksidan...
        self.dismiss(animated: true, completion: nil)
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
