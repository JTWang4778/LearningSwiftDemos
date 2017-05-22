//
//  ViewController.swift
//  14-transform动画
//
//  Created by 王锦涛 on 2017/5/22.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func translationAction(_ sender: Any) {
        print(NSStringFromCGRect(self.imageView.frame))
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            
            // 一次性的   每一次都是都是相对于最初的位置
//            self.imageView.transform = CGAffineTransform.init(scaleX: 20, y: 20)
            
            // 连续的变化  每一次相对于前一次动画结束时的位置
            self.imageView.transform = self.imageView.transform.translatedBy(x: 20, y: 20)
        }) { (finished) in
            print(NSStringFromCGRect(self.imageView.frame))
        }
    }
    @IBAction func rotateAction(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            
            // 一次性的   每一次都是都是相对于最初的位置
            //        self.imageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi * 0.25))
            
            self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(Double.pi * 0.25))

        }) { (finished) in
        }
        
        
        
    }
    @IBAction func scaleAction(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            
            // 一次性的   每一次都是都是相对于最初的位置
            //        self.imageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi * 0.25))
            
            self.imageView.transform = self.imageView.transform.scaledBy(x: 1.1, y: 1.1)
            
        }) { (finished) in
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

