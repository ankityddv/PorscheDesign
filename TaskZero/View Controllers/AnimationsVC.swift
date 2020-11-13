//
//  AnimationsVC.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 13/11/20.
//

import UIKit
import Lottie

class AnimationsVC: UIViewController {
    
    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimation()
    }
    
    func setUpAnimation(){
        //animationView.animation = Animation.named("liked")
        //animationView.frame = view.bounds
        //animationView.contentMode = .scaleAspectFit
        //animationView.loopMode = .loop
        //animationView.play()
    }

}
