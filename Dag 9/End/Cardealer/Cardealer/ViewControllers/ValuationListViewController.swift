//
//  ValuationListViewController.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import UIKit
import CoreData

class ValuationListViewController: UITableViewController {
    
    //Skapa en ny tom array av ValuationModel objekt...
    var valuations: [ValuationModel] = [ValuationModel]()
    var vehicles: [VehicleModel] = [VehicleModel]()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        
        //guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
        //let request: NSFetchRequest<Vehicle> = Vehicle.fetchRequest();
        
        if let vehiclesDb = try? context.fetch(Vehicle.fetchRequest()) as? [Vehicle]{
            
            for vehicle in vehiclesDb {
                let v = VehicleModel(regNo: vehicle.registrationNo ?? "",
                                     make: vehicle.make ?? "",
                                     model: vehicle.model ?? "",
                                     modelYear: Int(vehicle.modelYear),
                                     mileage: Int(vehicle.mileage),
                                     comment: vehicle.comment ?? "")
                
                let valuation = ValuationModel(status: .New, vehicle: v, comment: "")
                valuations.append(valuation)
                
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func addTapped() {
        performSegue(withIdentifier: "addVehicleSegue", sender: nil)
    }
    
    @objc func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTapped))
        }else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        UISwipeActionsConfiguration(actions: [deleteValuationAction(forRowAt: indexPath)])
    }
    
    func deleteValuationAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (contextualAction, swipeButton, completionHandler: (Bool) -> Void) in
            
            //guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
            
//            let request: NSFetchRequest<Vehicle> = Vehicle.fetchRequest()
//            let predicate = NSPredicate(format: "registrationNo == %@", vehicleToRemove.vehicle.regNo)
//
//            request.predicate = predicate
            let vehiclesDb = try? self.context.fetch(Vehicle.fetchRequest()) as? [Vehicle]
            
            self.context.delete(vehiclesDb![indexPath.row])
            do{
                try self.context.save()
            }catch{
                print("Det gick inge bra!")
            }
            
            self.valuations.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        return action
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valuations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var status: String = ""
        let valuation = valuations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleItem", for: indexPath)
        
        switch valuation.status {
        case .New:
            status = "NY"
        case .Valued:
            status = "VÄRDERAD"
        default:
            status = "NY"
        }
        
        cell.textLabel?.text = "\(valuation.vehicle.regNo) \(valuation.vehicle.make) \(valuation.vehicle.model)"
        cell.detailTextLabel?.text = "Årsmodell \(valuation.vehicle.modelYear) \(valuation.vehicle.mileage) km status \(status)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valuation = valuations[indexPath.row]
        let valuationTuple = (indexPath.row, valuation)
        
        performSegue(withIdentifier: "showVehicleDetailSegue", sender: valuationTuple)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showVehicleDetailSegue" {
            
            //Happy path😁
            guard let vc = segue.destination as? ValuationDetailViewController else { return }
            guard let valuation = sender as? (Int, ValuationModel) else { return }
            
            vc.valuation = valuation.1
            vc.valuationIndex = valuation.0
            vc.delegate = self
        }
        
        if segue.identifier == "addVehicleSegue" {
            guard let vc = segue.destination as? AddValuationViewController else { return }
            vc.delegate = self
        }
    }
}

// MARK: Saving and Updating data
extension ValuationListViewController: ValuationListDelegate {
    
    func save(valuation: ValuationModel) {
        //guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
        let v = Vehicle(context: context)
        v.registrationNo = valuation.vehicle.regNo
        v.comment = valuation.vehicle.comment
        v.model = valuation.vehicle.model
        v.make = valuation.vehicle.make
        v.mileage = Int32(valuation.vehicle.mileage)
        v.modelYear = Int32(valuation.vehicle.modelYear)
        
        try? context.save()
        
        valuations.append(valuation)
        tableView.reloadData()
    }
    
    func update(task: ValuationModel, index: Int) {
        valuations[index] = task
        tableView.reloadData()
    }
    
}
