//
//  SeeBurgerViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/6/23.
//

import UIKit

class SeeBurgerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var defaults = UserDefaults.standard

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bloodImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        // Do any additional setup after loading the view.
        label.text = "Name: \(AppData.names[AppData.clicked])\nRate: \(AppData.rates[AppData.clicked])\nBirthday: \(AppData.dates[AppData.clicked].formatted())"
    }
    
    @IBAction func killButton(_ sender: Any) {
      
        if(AppData.burgers[AppData.clicked].contains(_: "seaverrr")){
            let ac = UIAlertController(title: "There is a Seaver in this burger", message: nil, preferredStyle: .alert)

            let submitAction = UIAlertAction(title: "Ok I won't kill it", style: .default)
            
            ac.addAction(submitAction)

            present(ac, animated: true)
        }
        else{
            
            self.bloodImage.image = UIImage(named: "blood")!
            bloodImage.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                self.bloodImage.isHidden = true
            }
            
            AppData.burgers.remove(at: AppData.clicked)
            AppData.rates.remove(at: AppData.clicked)
            AppData.dates.remove(at: AppData.clicked)
            AppData.names.remove(at: AppData.clicked)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
               
                
                self.navigationController?.popViewController(animated: true)
            }
        }
      /*  let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.burgers){
            self.defaults.set(encoded, forKey: "theBurgers")
       }
        
        if let encoded = try? encoder.encode(AppData.dates){
            self.defaults.set(encoded, forKey: "theDates")
       }
        
        if let encoded = try? encoder.encode(AppData.names){
            self.defaults.set(encoded, forKey: "theNames")
       }
        
        if let encoded = try? encoder.encode(AppData.rates){
            self.defaults.set(encoded, forKey: "theRates")
       }
        */
        
       

        
    }
    
    
    
    @IBAction func editAction(_ sender: Any) {
        
        promptForAnswer()
       /*
        let encoder = JSONEncoder()
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
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.burgers[AppData.clicked].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CrazyCell
        cell.img.image = UIImage(named: AppData.burgers[AppData.clicked][indexPath.row])
        return cell
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Re-Rate the burger a number!!!", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            AppData.rates.remove(at: AppData.clicked)
            AppData.rates.insert(Int(answer.text!) ?? 0, at: AppData.clicked)
            self.label.text = "Name: \(AppData.names[AppData.clicked])\nRate: \(AppData.rates[AppData.clicked])\nBirthday: \(AppData.dates[AppData.clicked].formatted())"
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
       
       
    }
    
}
    
    

