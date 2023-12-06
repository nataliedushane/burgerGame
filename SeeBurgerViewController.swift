//
//  SeeBurgerViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/6/23.
//

import UIKit

class SeeBurgerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        // Do any additional setup after loading the view.
        label.text = "Rate: \(AppData.rates[AppData.clicked])\nBirth Day: \(AppData.dates[AppData.clicked].formatted())"
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.burgers[AppData.clicked].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.backgroundColor = AppData.burgers[AppData.clicked][indexPath.row]
        return cell!
    }
}
