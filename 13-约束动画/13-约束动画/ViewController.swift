//
//  ViewController.swift
//  13-约束动画
//
//  Created by 王锦涛 on 2017/5/16.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleViewHright: NSLayoutConstraint!
    
    var isOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            约束动画或者约束的方式：
            1，直接拖线  形成属性
            2，通过遍历控件的constraints 约束数组 找到对应的约束 设置值
         */
        
    }
    @IBAction func didClickOpenCloseButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            // 改变高度
            self.titleViewHright.constant = self.isOpen ? 64 : 200
            self.titleLabel.text = self.isOpen ? "Packing List" : "Select items"
            // 找到特定约束 改变
            for constraint in self.titleLabel.superview!.constraints {

                if constraint.firstItem as? NSObject == self.titleLabel && constraint.firstAttribute == .centerX{
                    constraint.constant = self.isOpen ? 0 : -100
                }
                
                if constraint.firstItem as? NSObject == self.titleLabel && constraint.firstAttribute == .centerY{
                    constraint.constant = self.isOpen ? 0 : -30
                }
            }
            // 旋转按钮
            let angle = self.isOpen ?  0.0 : CGFloat(M_PI_4)
            self.closeButton.transform = CGAffineTransform(rotationAngle: angle)
            
            // 强制重新布局 不然没有回弹效果
            self.view.layoutIfNeeded()
        }) { (finished) in
            self.isOpen = !self.isOpen
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

