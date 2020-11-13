//
//  ProfileVC.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 13/11/20.
//

import UIKit
import Lottie

class ProfileVC: UIViewController {

    @IBOutlet weak var animationVieww: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family: String in UIFont.familyNames
              {
                  print(family)
                  for names: String in UIFont.fontNames(forFamilyName: family)
                  {
                      print("== \(names)")
                  }
              }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpAnimation()
    }
    
    func setUpAnimation(){
        animationVieww.loopMode = .loop
        animationVieww.play()
    }

}
