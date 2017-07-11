//
//  CAGradientLayerTestController.swift
//  核心绘图
//
//  Created by 王锦涛 on 2017/7/9.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class CAGradientLayerTestController: UIViewController {
    
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.gray
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.black.cgColor,UIColor.red.cgColor,UIColor.orange.cgColor,UIColor.yellow.cgColor]
//        gradientLayer.locations = [0,0.3,0.6,0.8]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        gradientLayer.backgroundColor = UIColor.white.cgColor
        self.view.layer.addSublayer(gradientLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
