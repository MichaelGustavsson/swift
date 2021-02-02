//
//  SearchVehicleViewController.swift
//  WestCoastCars
//
//  Created by Michael Gustavsson on 2021-01-27.
//

import UIKit

class SearchVehicleViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    let vehicle = Vehicle()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func SearchButton(_ sender: UIButton) {
        
        //Fejk, sök efter bil i register baserat på regnummer.
        vehicle.make = "Kia"
        vehicle.model = "Ceed"
        vehicle.modelYear = 2017
        
        //Defensiv programmering
        if let regNo = searchField.text {
            vehicle.regNo = regNo
        }
        
        self.performSegue(withIdentifier: "searchVehicle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "searchVehicle"){
            let destination = segue.destination as! RegisterVehicleViewController
            destination.vehicle = self.vehicle
        }
    }
}
