//
//  DetailExpandedVC.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 09/11/20.
//

import UIKit

class DetailExpandedVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    // Create the container view
    var containerView = UIView()
    // Initialise slideup height
    let slideUpViewHeight: CGFloat = 428
    
    // Initialising DetailView elements
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var downloadButton: UIButton!
    
    // Initialising popupView elements
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var greenButton: UIButton!
    @IBAction func greenBttnTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenButton.layer.cornerRadius = 29.5
        popUpView.layer.cornerRadius = 20
        productImageView.layer.cornerRadius = 25
        downloadButton.layer.cornerRadius = 29.5
        
        // Setup downloadButton
        downloadButton.addTarget(self, action: #selector(action1(_:)), for: .touchUpInside)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BlankDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlankDetailCollectionViewCell", for: indexPath) as! BlankDetailCollectionViewCell
        cell.contentView.layer.cornerRadius = 25
        return cell
    }
    
    // Setup button actions
    @objc func action1(_ sender: Any) {
        print("Lol")
        action2(sender)
    }
    @objc func action2(_ sender: Any) {
        
        let window = UIApplication.shared.keyWindow
          containerView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
          containerView.frame = self.view.frame
          window?.addSubview(containerView)
        
        // Since this view will be closed on tapping, we’ll also add a tap and swipe down gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(slideUpViewTapped))
          containerView.addGestureRecognizer(tapGesture)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(slideUpViewTapped))
            swipeDown.direction = .down
            containerView.addGestureRecognizer(swipeDown)
        
        // Container View Animation on opening
        containerView.alpha = 0
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
          }, completion: nil)
        
        // Set up PopUp View
        let screenSize = UIScreen.main.bounds.size
        popUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: slideUpViewHeight)
        window?.addSubview(popUpView)
        
        // Popup View animation on opening
        UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
            self.popUpView.frame = CGRect(x: 0, y: screenSize.height - self.slideUpViewHeight, width: screenSize.width, height: self.slideUpViewHeight)
          }, completion: nil)
        
    }
    
    
    @objc func slideUpViewTapped() {
        
        // Container View animation on closing
        let screenSize = UIScreen.main.bounds.size
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0
          }, completion: nil)
        
        // PopUp View animation on closing
        _ = UIScreen.main.bounds.size
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0
            self.popUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.slideUpViewHeight)
          }, completion: nil)
        
    }
    

}
