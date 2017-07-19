//
//  ViewController.swift
//  核心绘图
//
//  Created by 王锦涛 on 2017/7/5.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dataArr = [
                    ["t":100, "x":10, "y":10],
                    ["t":200, "x":34, "y":50],
                    ["t":500, "x":40, "y":100],
                    ["t":1000, "x":60, "y":20],
                    ["t":2000, "x":100, "y":200],
                    ["t":5000, "x":280, "y":10]
                    ]
    
    let shapeLayer = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = true
//        
        let lineView = LineView.init(frame: CGRect(x: 20, y: 300, width: 300, height: 300))
        lineView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        lineView.startAnimation(dataArr: self.dataArr)
        self.view.addSubview(lineView)
        
        
        
        let label = UILabel()
        label.text = "渐变文字"
        label.sizeToFit()
        label.center = CGPoint(x: 200, y: 200)
        self.view.addSubview(label)
        
        gradientLayer.frame = label.frame
        gradientLayer.colors = [UIColor.black.cgColor,UIColor.red.cgColor,UIColor.orange.cgColor,UIColor.yellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        self.view.layer.addSublayer(gradientLayer)
        gradientLayer.mask = label.layer
        
        label.frame = gradientLayer.bounds // 这一步很重要要  要重新设置frame
        
        
        // 利用CAShapeLayer  绘制指定圆角矩形
        
        shapeLayer.lineWidth = 3
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        
        let rect = CGRect(x: 20, y: 64, width: 100, height: 100)
        let radii = CGSize(width: 20, height: 20)
        let corners = UIRectCorner.init(rawValue: UIRectCorner.bottomLeft.rawValue + UIRectCorner.topRight.rawValue)
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
        
        shapeLayer.frame = rect
        self.view.layer.addSublayer(shapeLayer)
        shapeLayer.path = path.cgPath
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

