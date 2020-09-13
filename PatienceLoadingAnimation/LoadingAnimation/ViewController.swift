//
//  ViewController.swift
//  LoadingAnimation
//
//  Created by AJ on 12/09/20.
//  Copyright © 2020 AJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rotationImage: UIImageView!
    @IBOutlet weak var lodaingMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       loadingViewWithMessage(message: "Fetching Data....Have Patience...." )
    }
    func loadingViewWithMessage(message: String) {
        rotationImage.startRotating(duration: 5)
        lodaingMessage.text = message
    }

}


extension UIView {
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
         
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(CGFloat.pi * 2.0)
            self.layer.add(animate, forKey: kAnimationKey)
        }
    }
    func stopRotating() {
        let kAnimationKey = "rotation"
         
        if self.layer.animation(forKey: kAnimationKey) != nil {
            self.layer.removeAnimation(forKey: kAnimationKey)
        }
    }
}
