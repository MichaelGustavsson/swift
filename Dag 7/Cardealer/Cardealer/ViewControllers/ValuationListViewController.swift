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
        
    }

    func setupValuations() {
        let kia = VehicleModel(make: "Kia", model: "Ceed", modelYear: 2018, mileage: 25000)
        let valuation1 = ValuationModel(status: .New, vehicle: kia)
        
        let bmw = VehicleModel(make: "BMW", model: "320i", modelYear: 2015, mileage: 180000)
        let valuation2 = ValuationModel(status: .New, vehicle: bmw)
        
        let volvo = VehicleModel(make: "Volvo", model: "V70", modelYear: 2008, mileage: 350000)
        let valuation3 = ValuationModel(status: .New, vehicle: volvo)
        
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
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ValuationListViewController: ValuationListDelegate {
    
    func update(task: ValuationModel, index: Int) {
        valuations[index] = task
        tableView.reloadData()
    }
    
}
