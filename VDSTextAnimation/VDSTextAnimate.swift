//
//  VDSTextAnimate.swift
//  VDSTextAnimation
//
//  Created by Vimal Das on 11/07/18.
//  Copyright © 2018 Vimal Das. All rights reserved.
//

import UIKit

class VDSTextAnimate: UIStackView {

    @IBInspectable
    var text:String = "" {
        didSet{
            initSetup()
        }
    }
    
    @IBInspectable
    var animationDuration:CGFloat = 0.55 {
        didSet{
            initSetup()
        }
    }
    
    @IBInspectable
    var textColor:UIColor = .black {
        didSet{
            initSetup()
        }
    }
    
    @IBInspectable
    var fontSize:CGFloat = 17.0 {
        didSet{
            initSetup()
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        initStackView()
    }
    
    private func initSetup() {
        
        for lbl in arrangedSubviews {
            self.removeArrangedSubview(lbl)
            lbl.removeFromSuperview()
        }
        
        for letter in text {
            let lbl = UILabel()
            lbl.text = String(letter)
            lbl.textColor = textColor
            lbl.font = lbl.font.withSize(fontSize)
            self.addArrangedSubview(lbl)
        }
        initAnimation()
    }
    
    private func initStackView() {
        self.alignment = .fill
        self.distribution = .fillEqually
        self.axis = .horizontal
    }
    
    private func initAnimation() {
        for label in self.arrangedSubviews {
            label.alpha = 0
            label.transform = CGAffineTransform(translationX: 0, y: -50)
        }
        
        startAnimation()
    }

    private func startAnimation() {
        
        var delay:CGFloat = 0.2
        
        for label in self.arrangedSubviews {
            UIView.animate(withDuration: TimeInterval(animationDuration), delay: TimeInterval(delay), options: [.repeat,.autoreverse,.curveEaseInOut], animations: {
                label.alpha = 1
                label.transform = CGAffineTransform.identity
            }, completion: nil)
            
            delay += 0.2
        }
    }
    
}
