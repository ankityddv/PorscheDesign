//
//  AnimationsVC.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 13/11/20.
//

import UIKit
import Lottie

class AnimationsVC: UIViewController {

    @IBOutlet weak var animationVieww: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpAnimation()
    }
    
    func setUpAnimation(){
        animationVieww.loopMode = .loop
        animationVieww.play()
    }

}