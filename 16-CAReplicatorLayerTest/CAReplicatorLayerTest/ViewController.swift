//
//  ViewController.swift
//  CAReplicatorLayerTest
//
//  Created by 王锦涛 on 2017/7/19.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var replicatorLayer:CAReplicatorLayer!
    
    let kWidth = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
        
//        typeOne()
        typeTwo()
        
        
    }
    func typeTwo() // 加载提示
    {
        let animationView = UIView.init(frame: CGRect(x: 0, y: 300, width: kWidth, height: 200))
        animationView.backgroundColor = UIColor.lightGray
        self.view.addSubview(animationView)
        
        let circleLayer = CALayer()
        circleLayer.frame = CGRect(x: (kWidth - 20) * 0.5, y:0 , width: 20, height: 20)
            // CGRect(x: (kWidth - 20) * 0.5, y: (200 - 20) * 0.5, width: 20, height: 20)
        circleLayer.backgroundColor = UIColor.red.cgColor
        circleLayer.cornerRadius = 10
        circleLayer.masksToBounds = true
        animationView.layer.addSublayer(circleLayer)
        
        
        let replicate = CAReplicatorLayer.init()
        replicate.frame = animationView.bounds
        replicate.instanceCount = 12
        replicate.instanceTransform = CATransform3DMakeRotation(CGFloat(Double.pi / 6.0), 0, 0, 1)
        replicate.instanceAlphaOffset = -(1 / 12.0)
        replicate.addSublayer(circleLayer)
        animationView.layer.addSublayer(replicate)
        
        
        let roteAnimation = CABasicAnimation.init(keyPath: "transform")
        roteAnimation.toValue = CATransform3DMakeRotation(CGFloat(-Double.pi * 2), 0, 0, 1)
        roteAnimation.duration = 2.0
        roteAnimation.repeatCount = MAXFLOAT
        circleLayer.add(roteAnimation, forKey: "transformKey")
        
    }
    func typeOne()
    {
        let animationView = UIView.init(frame: CGRect(x: 0, y: 300, width: kWidth, height: 200))
        animationView.backgroundColor = UIColor.lightGray
        self.view.addSubview(animationView)
        
        let circleView = UIView.init(frame: CGRect(x: (kWidth - 20) * 0.5, y: (200 - 20) * 0.5, width: 20, height: 20))
        circleView.backgroundColor = UIColor.red
        circleView.layer.cornerRadius = 10
        circleView.layer.masksToBounds = true
        animationView.addSubview(circleView)
        
        let scaleAniamtion = CABasicAnimation.init(keyPath: "transform")
        scaleAniamtion.toValue = CATransform3DMakeScale(10, 10, 1)
        scaleAniamtion.duration = 2.0
        scaleAniamtion.repeatCount = MAXFLOAT
        circleView.layer.add(scaleAniamtion, forKey: "transformKey")
        
        let opacityAniamtion = CABasicAnimation.init(keyPath: "opacity")
        opacityAniamtion.toValue = 0
        opacityAniamtion.duration = 2.0
        opacityAniamtion.repeatCount = MAXFLOAT
        circleView.layer.add(opacityAniamtion, forKey: "opacityKey")
        
        let replicate = CAReplicatorLayer.init()
        replicate.frame = animationView.bounds
        replicate.instanceCount = 3
        replicate.instanceDelay = 0.3
        replicate.addSublayer(circleView.layer)
        animationView.layer.addSublayer(replicate)
    }
    
    func setupUI() {
        let animationView = UIView()     // 创建一个背景视图
        animationView.bounds = CGRect(x: 0, y: 0, width: kWidth, height: 200) //CGRect(0, 0, kWidth, 200)
        animationView.center = self.view.center
        self.view.addSubview(animationView)
        animationView.backgroundColor = UIColor.lightGray
        animationView.clipsToBounds = true
        
        let animationLayer = CAShapeLayer()      // 动画图层,就是不停变大的那个圆
        animationLayer.backgroundColor = UIColor.red.cgColor
        animationLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        animationLayer.cornerRadius = 10
        animationLayer.position = CGPoint(x: kWidth/2, y: 100) //CGPointMake(kWidth/2, 100)
        
        // 放大的动画
        let transformAnim = CABasicAnimation(keyPath: "transform")
//        let value = NSValue.init(CATransform3D: CATransform3DMakeScale(10, 10, 1))
        transformAnim.toValue = CATransform3DMakeScale(10, 10, 1)
        transformAnim.duration = 2
        
        // 透明度动画(其实也可以直接设置CAReplicatorLayer的instanceAlphaOffset来实现)
        let alphaAnim = CABasicAnimation(keyPath: "opacity")
        alphaAnim.toValue = 0
        alphaAnim.duration = 2
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [transformAnim,alphaAnim]
        animGroup.duration = 2
        animGroup.repeatCount = HUGE
        animationLayer.add(animGroup, forKey: nil)
        
        replicatorLayer = CAReplicatorLayer()
        replicatorLayer.addSublayer(animationLayer);
        replicatorLayer.instanceCount = 3  //三个复制图层
        replicatorLayer.instanceDelay = 0.3  // 复制间隔0.3秒
        animationView.layer.addSublayer(replicatorLayer)
    }

}

