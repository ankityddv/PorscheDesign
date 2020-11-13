//
//  ProductImageVC.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 13/11/20.
//

import UIKit

class ProductImageVC: UIViewController {
    
    @IBOutlet weak var productImageVieww: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismisss(_:)))
            swipeDown.direction = .down
            view.addGestureRecognizer(swipeDown)
    }
    
    @objc func dismisss(_ sender: Any)  {
        self.dismiss(animated: true, completion: nil)
    }
    
}
