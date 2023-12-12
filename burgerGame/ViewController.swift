//
//  ViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/5/23.
//


import UIKit

class AppData : Codable{
    static var burgers = [[UIColor]]()
    static var clicked = 0
    static var rates = [Int]()
    static var dates = [Date]()
    static var names = [String]()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toBurgerAction(_ sender: Any) {
        performSegue(withIdentifier: "toBurger", sender: self)
    }
    
    @IBAction func toBurgersAction(_ sender: Any) {
        performSegue(withIdentifier: "toBurgers", sender: self)

    }
    
}

