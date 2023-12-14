//
//  ViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/5/23.
//


import UIKit

class AppData : Codable{
    static var burgers = [[String]]()
    static var clicked = 0
    static var rates = [Int]()
    static var dates = [Date]()
    static var names = [String]()
}

class ViewController: UIViewController {

    var defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       /* if let items = defaults.data(forKey: "theBurgers") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([[String]].self, from: items) {
                AppData.burgers  = decoded
                        }
                }
        
        if let items = defaults.data(forKey: "theRates") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Int].self, from: items) {
                AppData.rates  = decoded
                        }
                }
        
        
        if let items = defaults.data(forKey: "theNames") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items) {
                AppData.names  = decoded
                        }
                }
        
        if let items = defaults.data(forKey: "theDates") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Date].self, from: items) {
                AppData.dates  = decoded
                        }
                }
        */
    }

    @IBAction func toBurgerAction(_ sender: Any) {
        performSegue(withIdentifier: "toBurger", sender: self)
    }
    
    @IBAction func toBurgersAction(_ sender: Any) {
        performSegue(withIdentifier: "toBurgers", sender: self)

    }
    
}

