//
//  ViewController.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 09/11/20.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var imgArr = ["one","two","three"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.imageVieww.image = UIImage(named: imgArr[indexPath.row])
        cell.imageVieww.layer.cornerRadius = 25
        cell.greenButton.layer.cornerRadius = 29.5
        cell.contentView.layer.cornerRadius = 38
        cell.contentView.clipsToBounds = true
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let DetailExpandedVC =  self.storyboard!.instantiateViewController(withIdentifier: "DetailExpandedVC") as! DetailExpandedVC
            DetailExpandedVC.modalTransitionStyle = .crossDissolve
            self.present(DetailExpandedVC, animated: true, completion: nil)
        }
    }
    

    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.layer.cornerRadius = 15
        // set default theme to light only
        UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
        }
    }


}

