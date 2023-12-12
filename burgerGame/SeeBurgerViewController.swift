//
//  SeeBurgerViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/6/23.
//

import UIKit

class SeeBurgerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
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
    
    
    
    @IBAction func editAction(_ sender: Any) {
        
        promptForAnswer()
        
        label.text = "Rate: \(AppData.rates[AppData.clicked])\nBirthday: \(AppData.dates[AppData.clicked].formatted())"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.burgers[AppData.clicked].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.backgroundColor = AppData.burgers[AppData.clicked][indexPath.row]
        return cell!
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Re-Rate the burger a number!!!", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            AppData.rates.remove(at: AppData.clicked)
            AppData.rates.insert(Int(answer.text!) ?? 0, at: AppData.clicked)
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
       
    }
    
}
    
    

