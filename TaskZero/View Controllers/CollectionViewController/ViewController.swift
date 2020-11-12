//
//  ViewController.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 09/11/20.
//

import UIKit
import Hero //To implement app store like transition animation

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var imgArr = ["one","two","three"] //images for collection view
    
    @IBOutlet weak var bgView: UIView!
    
    
    //MARK:- Setup CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.imageVieww.image = UIImage(named: imgArr[indexPath.row])
        cell.imageVieww.layer.cornerRadius = 25
        cell.greenButton.layer.cornerRadius = 29.5
        cell.contentView.layer.cornerRadius = 30
        /*
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2.5, height: 15.0)
        cell.layer.shadowRadius = 10.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        */
        
        // Initialise id to animate the view controller tranition
        cell.contentView.hero.id = "lol"
        cell.greenButton.hero.id = "lmao" // Button to image transition
        
        cell.contentView.clipsToBounds = true
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let DetailExpandedVC =  self.storyboard!.instantiateViewController(withIdentifier: "DetailExpandedVC") as! DetailExpandedVC
            self.present(DetailExpandedVC, animated: true, completion: nil)
        }
        else {
            print("Dead end.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

