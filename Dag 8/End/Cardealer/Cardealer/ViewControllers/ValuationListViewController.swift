//
//  ValuationListViewController.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import UIKit

class ValuationListViewController: UITableViewController {
    
    //Skapa en ny tom array av ValuationModel objekt...
    var valuations: [ValuationModel] = [ValuationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        setupValuations()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
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
            print("Deleting \(indexPath.row)")
            
            self.valuations.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        return action
    }

    func setupValuations() {
        let kia = VehicleModel(make: "Kia", model: "Ceed", modelYear: 2018, mileage: 25000, comment: "Bra första bil")
        let valuation1 = ValuationModel(status: .New, vehicle: kia, comment: "Bra bil")
        
        let bmw = VehicleModel(make: "BMW", model: "320i", modelYear: 2015, mileage: 180000, comment: "Fi n i lacken")
        let valuation2 = ValuationModel(status: .New, vehicle: bmw, comment: "Skakar lite i ratten")
        
        let volvo = VehicleModel(make: "Volvo", model: "V70", modelYear: 2008, mileage: 350000, comment: "Nya däck runt om, nyservad")
        let valuation3 = ValuationModel(status: .New, vehicle: volvo, comment: "Byte av bromsok måste ske")
        
        valuations.append(valuation1)
        valuations.append(valuation2)
        valuations.append(valuation3)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        
        cell.textLabel?.text = "\(valuation.vehicle.make) \(valuation.vehicle.model)"
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

extension ValuationListViewController: ValuationListDelegate {
    
    func save(valuation: ValuationModel) {
        self.valuations.append(valuation)
        tableView.reloadData()
    }
    
    func update(task: ValuationModel, index: Int) {
        valuations[index] = task
        tableView.reloadData()
    }
    
}
