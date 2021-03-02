//
//  ViewController.swift
//  Storage
//
//  Created by Michael Gustavsson on 2021-03-02.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var manufacturers = [Manufacturer]()
    var models = Set<VehicleModels>()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        load()

        for make in manufacturers {
            print(make.name!)

            print(make.models!.count)
            models = make.models! as! Set<VehicleModels>

            for model in models {
                print(model.name!)
            }
        }
        
//        let make = Manufacturer(context: context)
//        make.name = "BMW"
//        make.country = "Tyskland"
//
//        let model1 = VehicleModels(context: context)
//        model1.name = "320i"
//        model1.make = make
//
//        let model2 = VehicleModels(context: context)
//        model2.name = "525i"
//        model2.make = make
//
//        let model3 = VehicleModels(context: context)
//        model3.name = "X3"
//        model3.make = make
//
//        save()
    }

    func save(){
        do{
            try context.save()
        }catch{
            print("Fel!")
        }
    }
    
    func load(){
        let request: NSFetchRequest<Manufacturer> = Manufacturer.fetchRequest()
        
        do{
            manufacturers = try context.fetch(request)
        }catch{
            print("Fel igen!")
        }
    }
}

