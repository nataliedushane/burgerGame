//
//  BurgersViewController.swift
//  burgerGame
//
//  Created by NATALIE DUSHANE on 12/6/23.
//

import UIKit

class BurgersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var burgerCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(AppData.burgers.count)")
        if(AppData.burgers.count > 0){
            sort()
        }
        burgerCollection.reloadData()
        burgerCollection.delegate = self
        burgerCollection.dataSource =  self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        burgerCollection.reloadData()
    }

   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.burgers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CazyCell
        cell.labelOutlet.text = "\(AppData.names[indexPath.row])"
        
        if(indexPath.row == 0){
            cell.backgroundColor = UIColor(red: 244/256.0, green: 212/256.0, blue: 32/256.0, alpha: 1)
        }
        else if(indexPath.row == 1){
            cell.backgroundColor = UIColor(red: 213/256.0, green: 212/256.0, blue: 209/256.0, alpha: 1)
        }
        else if(indexPath.row == 2){
            cell.backgroundColor = UIColor(red: 143/256.0, green: 105/256.0, blue: 57/256.0, alpha: 1)
        }
        else{
            cell.backgroundColor = UIColor.yellow
        }
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AppData.clicked = indexPath.row
        performSegue(withIdentifier: "toSee", sender: self)
    }
    
    func sort(){
        var r = AppData.rates
        var d = AppData.dates
        var b = AppData.burgers
        var n = AppData.names
            var high = INT16_MIN
        var spot = 0
            AppData.rates = []
            AppData.dates = []
            AppData.burgers = []
            AppData.names = []
            print("\(r.count)")
            print("\(d.count)")
            print("\(b.count)")
        for k in 0...r.count-1{
            for i in 0 ... r.count-1 {
                if(r[i] > high ){
                    high = Int32(r[i])
                    spot = i
                    
                }
            }
            AppData.rates.append(r[spot])
            AppData.dates.append(d[spot])
            AppData.burgers.append(b[spot])
            AppData.names.append(n[spot])
            r.remove(at: spot)
            b.remove(at: spot)
            d.remove(at: spot)
            n.remove(at: spot)
            high = INT16_MIN
        }
        }
}
