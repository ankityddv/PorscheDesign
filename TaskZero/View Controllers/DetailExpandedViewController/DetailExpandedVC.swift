//
//  DetailExpandedVC.swift
//  TaskZero
//
//  Created by ANKIT YADAV on 09/11/20.
//

import UIKit
import Hero

class DetailExpandedVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    // Initialize variables and use as conditions while tapping a UIbutton
    var x = 0
    var y = 0
    
    // Create the container view to hide the bg view when PopUp card is presented.
    var containerView = UIView()      //Dark overlay view
    // Initialise PopUp height
    let popUpViewHeight: CGFloat = 428
    
    
    //MARK:- Declaring DetailView elements
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet var dismissButton: [UIView]!
    @IBOutlet weak var textfadeinView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var downloadopacityView: UIView!
    @IBOutlet weak var crossDownloadButton: UIButton!
    @IBOutlet weak var collectionVieww: UICollectionView!

    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- Declaring PopUp View elements
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var popUpContainerView: UIView! //View to present subviews
    @IBOutlet weak var greenButton: UIButton! //Next Button
    // View one
    @IBOutlet var ViewOne: UIView!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    // View Two
    @IBOutlet var ViewTwo: UIView!
    @IBOutlet weak var FiveBttn: UIButton!
    @IBOutlet weak var TenBttn: UIButton!
    @IBOutlet weak var FifteenBttn: UIButton!
    //View Three
    @IBOutlet var ViewThree: UIView!
    
    // Setup action of PopUp card Next Button
    @IBAction func greenBttnTapped(_ sender: Any) {
        if x==0 {
            ViewOne.isHidden = true
            //Add slide Transition to view
            let transition = CATransition()
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            popUpContainerView.layer.add(transition, forKey: nil)
            popUpContainerView.addSubview(ViewTwo)
            
            x += 1
        }
        else if x==1 {
            ViewTwo.isHidden = true
            //Add slide Transition to view
            let transition = CATransition()
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            popUpContainerView.layer.add(transition, forKey: nil)
            popUpContainerView.addSubview(ViewThree)
            
            UIView.animate(withDuration: 1.0, delay: 0.5,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: [.curveEaseIn],
                       animations: { [self] in
                        
                        greenButton.backgroundColor = UIColor(named: "GrayColor")
                        greenButton.setTitle("Confirm", for: .normal)
                        
            }, completion: nil)
            
            x += 1
        }
        else {
            
            print("Excess press")
        }
    }
    
    
    //MARK:- Setup blank CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BlankDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlankDetailCollectionViewCell", for: indexPath) as! BlankDetailCollectionViewCell
        cell.contentView.layer.cornerRadius = 25
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set default theme to light only
        UIApplication.shared.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .light
        }
        
        // Initialise id to animate the view controller tranition
        self.hero.isEnabled = true
        bgView.hero.id = "lol"
        productImageView.hero.id = "lmao"
        collectionVieww.hero.modifiers = [.translate(y:100)]
        
        // Swipe down to dismiss view controller
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismisss(_:)))
            swipeDown.direction = .down
            view.addGestureRecognizer(swipeDown)
        
        // DeatilView
        productImageView.layer.cornerRadius = 25
        downloadButton.layer.cornerRadius = 29.5
        downloadopacityView.layer.cornerRadius = 29.5
        crossDownloadButton.layer.cornerRadius = 22.5
        crossDownloadButton.alpha = 0.0
        // Setup downloadButton action
        downloadButton.addTarget(self, action: #selector(downloadBttnTapped(_:)), for: .touchUpInside)
        // Setup cross button image insets
        crossDownloadButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        // PopUp View
        greenButton.layer.cornerRadius = 29.5
        popUpView.layer.cornerRadius = 20
        // SetUp View One
        imageOne.layer.cornerRadius = 50
        imageTwo.layer.cornerRadius = 50
        //SetUp View two
        FiveBttn.layer.cornerRadius = 25
        TenBttn.layer.cornerRadius = 25
        FifteenBttn.layer.cornerRadius = 25
        
    }
    // Swipe down to dismiss view controller
    @objc func dismisss(_ sender: Any)  {
        self.dismiss(animated: true, completion: nil)
    }
   
    //MARK:- Setup download button action
    @objc func downloadBttnTapped(_ sender: Any) {
        if y == 0{
            shrinkButton(sender)
            y += 1
        }
        else if y == 1 {
            // Present PopUp
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                presentPopUp(sender)
                popUpContainerView.addSubview(self.ViewOne)
            }
            // Set the download button to initial State
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                y = 0
                
                UIView.animate(withDuration: 2.0, delay: 0.5,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.7,
                           options: [.curveEaseIn],
                           animations: { [self] in
                            self.downloadButton.frame = CGRect(x: 46, y: 783, width: 323, height: 59)
                            downloadButton.backgroundColor = UIColor(named: "GreenColor")
                            downloadButton.setTitle("DOWNLOAD 30MB", for: .normal)
                }, completion: nil)
            }
        }
    }
    
    // Animate download button and show cross button (ACTION 1)
    @objc func shrinkButton(_ sender: Any) {
        UIView.animate(withDuration: 2.0, delay: 0.5,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 0.7,
                   options: [.curveEaseIn],
                   animations: { [self] in
                    self.downloadButton.frame = CGRect(x: 46, y: 783, width: 261, height: 59) // decrease the width of download button
        }, completion: nil)
        
        crossDownloadButton.alpha = 0.0
        // fade in effect on button title and cross button
        UIView.animate(withDuration: 2.0,delay: 0.5, animations: { [self] in
                crossDownloadButton.alpha = 1.0
                downloadButton.setTitle("10MB/30MB", for: .normal)
        }) { [self] (finished) in
            // After finishing present pop up after a delay of 2 seconds and change cross button image to checked
            UIView.animate(withDuration: 1.0, animations: { [self] in
                downloadopacityView.alpha = 0.4
                })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                progressBarAnimation(sender) //progress bar animation will play after 1 secons
            }
        }
    }
    
    // Animate the button into a progress bar and hide cross button (ACTION 2)
    @objc func progressBarAnimation(_ sender: Any) {
        
        self.downloadButton.frame = CGRect(x: 46, y: 783, width: 0, height: 59) // hide download button
        
        UIView.animate(withDuration: 2.0, delay: 0.5,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 0.7,
                   options: [.curveEaseIn],
                   animations: { [self] in
                    self.downloadButton.frame = CGRect(x: 46, y: 783, width: 261, height: 59)
                    
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0,delay: 0.5, animations: { [self] in
            downloadopacityView.alpha = 0
        }) { [self] (finished) in
            UIView.animate(withDuration: 1.0, animations: { [self] in
                crossDownloadButton.alpha = 0.0 //hide cross button
                crossDownloadButton.setImage(UIImage(named: "check"), for: UIControl.State.normal)
            }) {(finished) in
                changeButtonColor(sender)
            }
        }
    }
    
    // Change color, titleLabel and Download Button size to original (ACTION 3)
    @objc func changeButtonColor(_ sender: Any) {
        UIView.animate(withDuration: 2.0, delay: 0.5,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 0.7,
                   options: [.curveEaseIn],
                   animations: { [self] in
                    self.downloadButton.frame = CGRect(x: 46, y: 783, width: 323, height: 59)
                    downloadButton.backgroundColor = UIColor(named: "SkyBlueColor")
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, animations: { [self] in
            downloadButton.setTitle("PLAY", for: .normal)
        }) {(finished) in
            /* Process one finished.
             Now press the download button again and the process will continue to present the pop up
             */
        }
    }
    
    // Present the PopUp after tapping the play button (ACTION 4)
    //Action setup in line 163
    @objc func presentPopUp(_ sender: Any) {
        let window = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
          containerView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
          containerView.frame = self.view.frame
          window?.addSubview(containerView)
        
        // Since this view will be closed on tapping, we’ll also add a tap and swipe down gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popUpViewTapped))
          containerView.addGestureRecognizer(tapGesture)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(popUpViewTapped))
            swipeDown.direction = .down
            containerView.addGestureRecognizer(swipeDown)
        
        // Container View Animation on opening
        containerView.alpha = 0
          UIView.animate(withDuration: 1,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
          }, completion: nil)
        
        // Set up PopUp View
        let screenSize = UIScreen.main.bounds.size
        popUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: popUpViewHeight)
        window?.addSubview(popUpView)
        
        // PopUp View animation on opening
        UIView.animate(withDuration: 1,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
            self.popUpView.frame = CGRect(x: 0, y: screenSize.height - self.popUpViewHeight, width: screenSize.width, height: self.popUpViewHeight)
          }, completion: nil)
        
    }
    
    // Closing animations of both container view and PopUp View
    @objc func popUpViewTapped() {
        // Container View animation on closing
        let screenSize = UIScreen.main.bounds.size
          UIView.animate(withDuration: 1,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0
          }, completion: nil)
        
        // PopUp View animation on closing
        _ = UIScreen.main.bounds.size
          UIView.animate(withDuration: 1,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0
            self.popUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.popUpViewHeight)
          }, completion: nil)
    }
    
}
