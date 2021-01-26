//
//  ViewController.swift
//  TheDice
//
//  Created by Michael Gustavsson on 2021-01-25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    
    //var index: Int = 0;
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }


    @IBAction func rollDice(_ sender: UIButton) {
        
        let dices = [#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "6")]
        
        diceOne.image = dices.randomElement()
        diceTwo.image = dices[Int.random(in: 0...5)]
    }
    
}

