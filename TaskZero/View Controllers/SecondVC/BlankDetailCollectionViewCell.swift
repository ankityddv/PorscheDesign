//
//  BlankDetailCollectionViewCell.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 10/11/20.
//

import UIKit

class BlankDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageVieww: UIImageView!
    //MARK:- Events
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            animate(isHighlighted: true)
        }

        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            animate(isHighlighted: false)
        }

        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesCancelled(touches, with: event)
            animate(isHighlighted: false)
        }

        //MARK:- Private functions
        private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)?=nil) {
            let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
            if isHighlighted {
                UIView.animate(withDuration: 0.3,
                               delay: 0,
                               usingSpringWithDamping: 1,
                               initialSpringVelocity: 0.4,
                               options: animationOptions, animations: {
                                self.transform = .init(scaleX: 0.96, y: 0.96)
                }, completion: completion)
            } else {
                UIView.animate(withDuration: 0.3,
                               delay: 0,
                               usingSpringWithDamping: 1,
                               initialSpringVelocity: 0.4,
                               options: animationOptions, animations: {
                                self.transform = .identity
                }, completion: completion)
            }
        }
}
