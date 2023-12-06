//
//  BurgerViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/5/23.
//

import UIKit

class BurgerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var tableView: UITableView!
    var colors = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource=self
        tableView.delegate=self
    }
    
    @IBAction func deleteLastAction(_ sender: Any) {
        colors.remove(at: 0)
        tableView.reloadData()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        AppData.burgers.append(colors)
        AppData.dates.append(Date())
        
        promptForAnswer()
        
    }
    
    
    @IBAction func lettuceAction(_ sender: Any) {
        colors.insert(UIColor(red: 107/256.0, green: 157/256.0, blue: 27/256.0, alpha: 1), at: 0)
        tableView.reloadData()
    }
    @IBAction func meatAction(_ sender: Any) {
        colors.insert(UIColor(red: 110/256.0, green: 48/256.0, blue: 42/256.0, alpha: 1), at: 0)
        tableView.reloadData()
    }
    @IBAction func bunAction(_ sender: Any) {
        colors.insert(UIColor(red: 251/256.0, green: 205/256.0, blue: 130/256.0, alpha: 1), at: 0)
        tableView.reloadData()
    }
    @IBAction func ketchupAction(_ sender: Any) {
        colors.insert(UIColor(red: 193/256.0, green: 34/256.0, blue: 23/256.0, alpha: 1), at: 0)
        tableView.reloadData()
    }
    @IBAction func tomatoAction(_ sender: Any) {
        colors.insert(UIColor(red: 247/256.0, green: 35/256.0, blue: 21/256.0, alpha: 1), at: 0)
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.backgroundColor = colors[indexPath.row]
        return cell!
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Rate the burger!!!", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            AppData.rates.append((Int)(answer.text!) ?? 0)
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
    }
    
}
