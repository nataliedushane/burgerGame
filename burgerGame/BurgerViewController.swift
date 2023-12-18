//
//  BurgerViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/5/23.
//

import UIKit

class BurgerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var defaults = UserDefaults.standard

    @IBOutlet weak var tableView: UITableView!
    var colors = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource=self
        tableView.delegate=self
    }
    
    @IBAction func deleteLastAction(_ sender: Any) {
        if(colors.count == 0){
            let ac = UIAlertController(title: "You don't have any ingredients to take away :(", message: nil, preferredStyle: .alert)

            let submitAction = UIAlertAction(title: "OK", style: .default)
            ac.addAction(submitAction)

            present(ac, animated: true)
        }
        else if(colors[0] == "seaverrr"){
                    let ac = UIAlertController(title: "You can't take away Seaver :(", message: nil, preferredStyle: .alert)

                    let submitAction = UIAlertAction(title: "Ok sorry that's my bad", style: .default)
                    ac.addAction(submitAction)

                    present(ac, animated: true)
                }
        else{
            colors.remove(at: 0)
            tableView.reloadData()
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        AppData.burgers.append(colors)
        AppData.dates.append(Date())
        promptForName()
        
      /*  let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.burgers){
           defaults.set(encoded, forKey: "theBurgers")
       }
        
        if let encoded = try? encoder.encode(AppData.dates){
           defaults.set(encoded, forKey: "theDates")
       }
        
        if let encoded = try? encoder.encode(AppData.names){
           defaults.set(encoded, forKey: "theNames")
       }
        
        if let encoded = try? encoder.encode(AppData.rates){
           defaults.set(encoded, forKey: "theRates")
       }
      */
        colors.removeAll()
     
        tableView.reloadData()
        
    }
    
    @IBAction func seaverAction(_ sender: Any) {
        colors.insert("seaverrr", at: 0)
        tableView.reloadData()
    }
    
    @IBAction func botBun(_ sender: Any) {
        colors.insert("botbun", at: 0)
        tableView.reloadData()
    }
    @IBAction func lettuceAction(_ sender: Any) {
        colors.insert("lettuce", at: 0)
        tableView.reloadData()
    }
    @IBAction func meatAction(_ sender: Any) {
        colors.insert("meat", at: 0)
        tableView.reloadData()
    }
    @IBAction func bunAction(_ sender: Any) {
        colors.insert("bun", at: 0)
        tableView.reloadData()
    }
    @IBAction func ketchupAction(_ sender: Any) {
        colors.insert("ketchup", at: 0)
        tableView.reloadData()
    }
    @IBAction func tomatoAction(_ sender: Any) {
        colors.insert("tomato", at: 0)
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CrazyCell?
        
        cell?.img.image = UIImage(named: colors[indexPath.row])
        
        return cell!
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Rate the burger a number!!!", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            AppData.rates.append((Int)(answer.text!) ?? 0)
            
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
    }
    
    func promptForName() {
        let ac = UIAlertController(title: "Name the Burger!!!", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Name him", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            AppData.names.append(answer.text!)
           
            self.promptForAnswer()
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
        
    }

}
