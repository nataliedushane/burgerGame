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
        burgerCollection.delegate = self
        burgerCollection.dataSource =  self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.burgers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CazyCell
        cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AppData.clicked = indexPath.row
        performSegue(withIdentifier: "toSee", sender: self)
    }
}
