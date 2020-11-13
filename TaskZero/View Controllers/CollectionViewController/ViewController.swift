//
//  ViewController.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 09/11/20.
//

import UIKit
import Hero //To implement app store like transition animation
import Lottie

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
        cell.imageVieww.layer.cornerRadius = 15
        cell.contentView.layer.cornerRadius = 20
        
        // Set animation to AnimatedButton
        cell.wishlistBttn.animation = Animation.named("TwitterHeartButton")

        // The animation goes outside of the bounds, thus turn off clipsToBounds
        cell.wishlistBttn.clipsToBounds = false

        // Set animation play ranges for different button state
        cell.wishlistBttn.setPlayRange(fromMarker: "touchDownStart",
                                   toMarker: "touchDownEnd",
                                   event: .touchDown)

        cell.wishlistBttn.setPlayRange(fromMarker: "touchDownEnd",
                                   toMarker: "touchUpCancel",
                                   event: .touchUpOutside)

        cell.wishlistBttn.setPlayRange(fromMarker: "touchDownEnd",
                                   toMarker: "touchUpEnd",
                                   event: .touchUpInside)
        
        // Initialise id to animate the view controller tranition
        cell.contentView.hero.id = "lol"
        cell.imageVieww.hero.id = "lmao" // image to image transition
        
        cell.contentView.clipsToBounds = true
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let DetailExpandedVC =  self.storyboard!.instantiateViewController(withIdentifier: "DetailExpandedVC") as! DetailExpandedVC
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.navigationBar.isHidden = true
            self.present(DetailExpandedVC, animated: true, completion: nil)
        }
        else {
            print("Dead end.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To hide the top line
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }

}

