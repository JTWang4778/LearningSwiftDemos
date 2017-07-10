//
//  LineView.swift
//  核心绘图
//
//  Created by 王锦涛 on 2017/7/5.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    var dictArr : [[String : Int]]? {
        didSet{
//            self.setNeedsDisplay()
        }
    }
    
    var count = 0
    let shapeLayer = CAShapeLayer()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        
//    }
    
    func startAnimation( dataArr: [[String : Int]] ) {
        self.dictArr = dataArr
        
        shapeLayer.fillColor = UIColor.clear.cgColor// 设置
        shapeLayer.frame = self.bounds
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(shapeLayer)
        
        let path = UIBezierPath() // 只提供路径
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 50))
        
        
        // CAShapeLayer的可动画属性 path  strokeStart  strokeEnd   strokeColor lineWidth
        //  经过测试 发现path  和 strokeColor 属性添加动画 没有效果  为啥呢 ？？
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.duration = 2.0
        animation.fromValue = 2.0
        animation.toValue = 10.0
        shapeLayer.add(animation, forKey: "lineWidth")
        
        let lineAnimation = CABasicAnimation(keyPath: "strokeEnd")
        lineAnimation.duration = 2.0
        lineAnimation.fromValue = 0
        lineAnimation.toValue = 1.0
        shapeLayer.add(lineAnimation, forKey: "strokeEnd")
        
        let strokeColorAnimation = CABasicAnimation(keyPath: "strokeColor")
        strokeColorAnimation.duration = 2.0
        strokeColorAnimation.fromValue = UIColor.red.cgColor
        strokeColorAnimation.toValue = UIColor.blue.cgColor
        shapeLayer.add(lineAnimation, forKey: "strokeColor")
        
        shapeLayer.path = path.cgPath
        
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 这种方式不会有动画效果
//        UIView.animate(withDuration: 100) {
//            let contextRef = UIGraphicsGetCurrentContext()!
//            contextRef.setLineWidth(1)
//            contextRef.setStrokeColor(UIColor.red.cgColor)
//            
//            let path = CGMutablePath()
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            contextRef.addPath(path)
//            contextRef.strokePath()
//        }
        
    }

}
