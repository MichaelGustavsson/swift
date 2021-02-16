//
//  AddValuationViewController.swift
//  Cardealer
//
//  Created by Michael Gustavsson on 2021-02-10.
//

import UIKit

class AddValuationViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let item = UINavigationItem(title: "Ny värdering")
        item.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAdd))
        navigationBar.items = [item]
    }
    
    
    @objc func cancelAdd() {
        dismiss(animated: true, completion: nil)
    }
}
