//
//  LoadingAnimationView.swift
//  CAReplicatorLayerTest
//
//  Created by 王锦涛 on 2017/7/20.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class LoadingAnimationView: UIView {

    init(frame: CGRect, smallWidth: CGFloat,backgroundColo: UIColor, smallColor: UIColor) {
        super.init(frame: frame)
        let selfWidth = frame.size.width
        let selfHeight = frame.size.height
        let bigCircleWidth = frame.size.width < frame.size.height ?  (frame.size.width - smallWidth) : (frame.size.height - smallWidth)
        
        let animationView = UIView.init(frame: self.bounds)
        animationView.backgroundColor = backgroundColor
        self.addSubview(animationView)
        
        
        let circleLayer = CALayer()
        circleLayer.frame = CGRect(x: (selfWidth - smallWidth) * 0.5, y:0 , width: smallWidth, height: smallWidth)
        circleLayer.backgroundColor = smallColor.cgColor
        circleLayer.cornerRadius = smallWidth * 0.5
        circleLayer.masksToBounds = true
        
        let keyFrameAnimation = CAKeyframeAnimation()
        let rect = CGRect(x: (selfWidth - bigCircleWidth) * 0.5, y: (selfHeight - bigCircleWidth) * 0.5, width: bigCircleWidth, height: bigCircleWidth)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: bigCircleWidth * 0.5)
        keyFrameAnimation.calculationMode = "paced" // discrete paced cubic cubicPaced
        keyFrameAnimation.keyPath = "position"
        keyFrameAnimation.path = path.cgPath
        keyFrameAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        keyFrameAnimation.duration = 2.0
        keyFrameAnimation.repeatCount = MAXFLOAT
        circleLayer.add(keyFrameAnimation, forKey: "keyFrameAnimation")
        
        let replicate = CAReplicatorLayer.init()
        replicate.frame = self.bounds
        replicate.instanceCount = 6
        replicate.instanceAlphaOffset = -(1 / 6.0) //
        replicate.addSublayer(circleLayer)
        replicate.instanceDelay = (1.0 / 12.0)
        animationView.layer.addSublayer(replicate)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
