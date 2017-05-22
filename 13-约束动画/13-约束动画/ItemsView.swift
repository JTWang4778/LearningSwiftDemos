//
//  ItemsView.swift
//  13-约束动画
//
//  Created by 王锦涛 on 2017/5/16.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ItemsView: UIScrollView {

    var selectItem : ((Int) -> ())?
    
    let width = 80
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
        for i in 0..<10 {
            let imageName = "summericons_100px_0\(i)"
            let imageView = UIImageView.init(image: UIImage.init(named: imageName))
            imageView.frame = CGRect(x: i * width, y: 0, width: width, height: width)
            imageView.tag = 100 + i
            imageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.didClickImage(tap:)))
            imageView.addGestureRecognizer(tap)
            self.addSubview(imageView)
        }
        
        self.contentSize = CGSize(width: width * 10, height: width)
    }
    
    
    func didClickImage(tap: UIGestureRecognizer) {
        let imageView = tap.view as! UIImageView
        self.selectItem?(imageView.tag - 100)
    }
    
    // 重写方法   加动画
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        // 当加到父控件上的时候调用
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            
            self.center.x -= self.frame.size.width
        }) { (finished) in
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
